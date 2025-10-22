part of '../../details_product.dart';

class DetailsProductScreen extends StatelessWidget {
  final ProductModel product;

  DetailsProductScreen(this.product, {super.key});

  final List<String> avaliableSizes = ['S', 'L', 'M', 'X', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationItem(
          portraitWidget: _PortraitLayout(
            product: product,
            avaliableSizes: avaliableSizes,
          ),
          landscapeWidget: _LandscapeLayout(
            product: product,
            avaliableSizes: avaliableSizes,
          ),
        ),
      ).paddingBody(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  final ProductModel product;
  final List<String> avaliableSizes;

  const _PortraitLayout({required this.product, required this.avaliableSizes});

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
          child: ProductPriceAndCart(product: product),
        ),
      ],
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
  final ProductModel product;
  final List<String> avaliableSizes;

  const _LandscapeLayout({required this.product, required this.avaliableSizes});

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
          child: ProductPriceAndCart(product: product),
        ),
      ],
    );
  }
}
