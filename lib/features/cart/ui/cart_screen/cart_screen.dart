part of '../../cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final TextEditingController _noteController;

  @override
  void initState() {
    _noteController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PaymentBloc>()..add(const LoadCartProductsEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              if (state.localProductsCartState == RequestStates.loaded) {
                if (state.localProductsCart.isEmpty) {
                  return const EmptyListWidgets(
                    message: 'No Product Added Yet!',
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const HeaderForMore(
                              title: AppStrings.cart,
                              hasBack: false,
                            ),
                            Spacing.spaceHS10,
                            const _DeliveryAddress(),
                            Divider(
                              thickness: 1,
                              color: context.colors.primary1,
                            ),
                            Spacing.spaceHS10,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.localProductsCart.length,
                              itemBuilder: (context, index) {
                                return ProductCardCart(
                                  product: state.localProductsCart[index],
                                  onQuantityChanged: (quantity) {
                                    context.read<PaymentBloc>().add(
                                      UpdateCartQuantityEvent(
                                        CartItemRequest(
                                          product: state
                                              .localProductsCart[index]
                                              .product,
                                          quantity: quantity,
                                        ),
                                        index,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Spacing.spaceHS10,
                            Divider(
                              thickness: 1,
                              color: context.colors.primary1,
                            ),
                            SubTotal(
                              cartSummary: CartSummary.builder()
                                  .withProducts(state.localProductsCart)
                                  .calculate(),
                            ),
                            Spacing.spaceHS10,
                            Divider(
                              thickness: 1,
                              color: context.colors.primary1,
                            ),
                            TextFormFieldWidget(
                              controller: _noteController,
                              keyboardType: TextInputType.text,
                              inputAction: TextInputAction.done,
                              onFieldSubmitted: (String p1) {},
                              label: 'Note',
                              hintText: 'Note',
                              maxLine: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocListener<PaymentBloc, PaymentState>(
                      listener: (context, state) {
                        switch (state.createOrderState) {
                          case RequestStates.loading:
                            showLoadingDialog(context);
                          case RequestStates.loaded:
                            RouteManager.rPopRoute(context);
                            context.read<PaymentBloc>().add(
                              const ClearCartEvent(),
                            );
                            RouteManager.rPushNamed(
                              context: context,
                              rName: AppRoutesNames.rCheckoutScreen,
                              arguments: state.createOrderEntity,
                            );
                          case RequestStates.error:
                            showSnackBar(
                              description: state.createOrderMessage,
                              state: ToastStates.error,
                              context: context,
                            );
                          default:
                        }
                      },
                      child: DefaultButtonWidget(
                        label: 'Go To Checkout',
                        onPressed: () {
                          context.read<PaymentBloc>().add(
                            CreateOrderEvent(
                              createOrderRequest: CreateOrderRequest(
                                cartItems: state.localProductsCart,
                                shippingAddress: const ShippingAddressModel(
                                  city: 'city',
                                  country: 'country',
                                  phone: 'phone',
                                  postalCode: '11723',
                                  street: 'street',
                                ),
                                notes: '_noteController.text',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('Something went wrong...'));
              }
            },
          ),
        ).paddingBody(),
      ),
    );
  }
}

class ProductCardCart extends StatelessWidget {
  final Function(int quantity) onQuantityChanged;
  final CartItemRequest product;

  const ProductCardCart({
    super.key,
    required this.product,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10.r),
        height: Spacing.cartH,
        width: Spacing.cartW,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: context.colors.primary0,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: context.colors.primary1),
            borderRadius: BorderRadius.circular(
              AppConstants.appBorderRadiusR10,
            ),
          ),
          shadows: [AppShadow.outerShadow],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.3,
                  child: NullableNetworkImage(
                    width: Spacing.s100,
                    height: Spacing.s100,
                    fit: BoxFit.contain,
                    imagePath: product.product.imageUrl,
                    notHaveImage: product.product.imageUrl.isEmpty,
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 1,
                            children: [
                              Text(
                                product.product.name,
                                style: context.typography.bodyMedium,
                              ),
                              Text(
                                '${product.product.averageRate}/5',
                                style: context.typography.caption.copyWith(
                                  color: context.colors.primary5,
                                ),
                              ),
                            ],
                          ),
                          CustomInkWell(
                            onTap: () {
                              context.read<PaymentBloc>().add(
                                RemoveProductFromCartEvent(product),
                              );
                            },
                            child: Icon(
                              Icons.restore_from_trash_rounded,
                              size: Spacing.iconSizeS24,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (product.product.hasOffer)
                            Flexible(
                              child: Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${NumberFormat('#,###', 'en').format(product.product.priceAfterOffer)}جم/',
                                        style: context.typography.bodyLarge
                                            .copyWith(
                                              color: context.colors.red,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${NumberFormat('#,###', 'en').format(product.product.price)}جم',
                                        style: context.typography.labelLarge
                                            .copyWith(
                                              color: context.colors.primary5,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 3,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          QuantitySelector(
                            initialQuantity: product.quantity,
                            onQuantityChanged: onQuantityChanged,
                            minQuantity: 1,
                            maxQuantity: 99,
                          ),
                        ],
                      ),
                      Text(
                        'Total Price: ${product.totalPrice}',
                        style: context.typography.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SubTotal extends StatelessWidget {
  final CartSummary cartSummary;
  const SubTotal({super.key, required this.cartSummary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub-total',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ ${cartSummary.subTotal}',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'VAT (%)',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ ${cartSummary.vat}',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ ${cartSummary.shippingFee}',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Divider(thickness: 0.5, color: context.colors.primary1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: context.typography.titleMedium),
            Text(
              '\$ ${cartSummary.total}',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
