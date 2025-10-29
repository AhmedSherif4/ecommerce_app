part of '../../details_product.dart';

class DetailsProductScreen extends StatefulWidget {
  final ProductModel product;

  DetailsProductScreen(this.product, {super.key});

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  final List<String> avaliableSizes = ['S', 'L', 'M', 'X', 'XL', 'XXL'];

  late final bool isProductInCart;
  @override
  void initState() {
    isProductInCart = context.read<PaymentBloc>().state.isProductInCart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationItem(
          portraitWidget: _PortraitLayout(
            product: widget.product,
            avaliableSizes: avaliableSizes,
            isProductInCart: isProductInCart,
          ),
          landscapeWidget: _LandscapeLayout(
            product: widget.product,
            avaliableSizes: avaliableSizes,
            isProductInCart: isProductInCart,
          ),
        ),
      ).paddingBody(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  final bool isProductInCart;
  final ProductModel product;
  final List<String> avaliableSizes;

  const _PortraitLayout({
    required this.product,
    required this.avaliableSizes,
    required this.isProductInCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderForMore(title: AppStrings.details),
                ProductImageWithFavourite(product: product),
                ProductTitleAndDescription(product: product),
                const ChooseSizeTitle(),
                ProductSizeSelector(avaliableSizes: avaliableSizes),
                Divider(thickness: 1, color: context.colors.primary1),
              ],
            ),
          ),
        ),
        Container(
          height: AppReference.deviceHeight(context) * 0.15,
          color: context.colors.primary0,
          padding: EdgeInsets.all(Spacing.s12.r),
          child: ProductPriceAndCart(
            product: product,
            isProductInCart: isProductInCart,
          ),
        ),
      ],
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
  final bool isProductInCart;
  final ProductModel product;
  final List<String> avaliableSizes;

  const _LandscapeLayout({
    required this.product,
    required this.avaliableSizes,
    required this.isProductInCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderForMore(title: AppStrings.details),
        // المحتوى الرئيسي
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProductImageWithFavourite(
                  product: product,
                ).paddingBody(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleAndDescription(product: product),
                      const ChooseSizeTitle(),
                      ProductSizeSelector(avaliableSizes: avaliableSizes),
                    ],
                  ),
                ).paddingBody(),
              ),
            ],
          ),
        ),
        Container(
          height: AppReference.deviceWidth(context) * 0.1,
          color: context.colors.primary0,
          padding: EdgeInsets.all(Spacing.s12.r),
          child: ProductPriceAndCart(
            product: product,
            isProductInCart: isProductInCart,
          ),
        ),
      ],
    );
  }
}
