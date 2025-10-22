part of '../../cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderForMore(title: AppStrings.cart),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ProductCardCart();
                      },
                    ),
                    SubTotal(),
                  ],
                ),
              ),
            ),
            DefaultButtonWidget(
              label: 'Go To Checkout',
              onPressed: () {
                RouteManager.rPushNamed(
                  context: context,
                  rName: AppRoutesNames.rCheckoutScreen,
                );
              },
            ),
          ],
        ),
      ).paddingBody(),
    );
  }
}

class ProductCardCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NullableNetworkImage(
              width: Spacing.s100,
              height: Spacing.s100,
              fit: BoxFit.fill,
              imagePath:
                  'https://lh3.googleusercontent.com/a/ACg8ocJLiPOmHDSGO6HMtuBT4Bv0BIqHZ3V9S6__OCXEJpcN6KOiKrY=s96-c',
              notHaveImage: false,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                          'Regular Fit Slogan',
                          style: context.typography.bodyMedium,
                        ),
                        Text(
                          'Size L',
                          style: context.typography.caption.copyWith(
                            color: context.colors.primary5,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.restore_from_trash_rounded,
                      size: Spacing.iconSizeS24,
                    ),
                  ],
                ),
                SizedBox(
                  width: 212.50.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$ 1,190', style: context.typography.bodyMedium),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 9,
                        children: [
                          CustomInkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.remove,
                              size: Spacing.iconSizeS20,
                            ),
                          ),
                          Text('2', style: context.typography.caption),
                          CustomInkWell(
                            onTap: () {},
                            child: Icon(Icons.add, size: Spacing.iconSizeS20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubTotal extends StatelessWidget {
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
              '\$ 5,870',
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
              '\$ 0.00',
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
              '\$ 80',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Divider(thickness: 1, color: context.colors.primary1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: context.typography.titleMedium),
            Text(
              '\$ 5,950',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
