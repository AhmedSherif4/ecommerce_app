part of '../../details_product.dart';

class ProductImageWithFavourite extends StatelessWidget {
  final ProductModel product;

  const ProductImageWithFavourite({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        NullableNetworkImage(
          imagePath: product.image,
          notHaveImage: false,
          fit: BoxFit.fill,
          height:
              (AppReference.isPortrait(context)
                  ? AppReference.deviceHeight(context)
                  : AppReference.deviceWidth(context)) *
              0.4,
          width: double.infinity,
        ),
        Positioned(
          top: -10,
          right: -10,
          child: CustomInkWell(
            onTap: () {
              context.read<SavedCubit>().toggleFavourite(product);
            },
            child: SvgPicture.asset(
              product.isFav
                  ? Assets.projectIconHeartFilled
                  : Assets.projectIconHeart,
              width: Spacing.iconSizeS24.r,
              height: Spacing.iconSizeS24.r,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductTitleAndDescription extends StatelessWidget {
  final ProductModel product;

  const ProductTitleAndDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: context.typography.titleLarge),
        Text(
          product.description,
          style: context.typography.titleMedium.copyWith(
            color: context.colors.primary5,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class ChooseSizeTitle extends StatelessWidget {
  const ChooseSizeTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Choose size',
      style: context.typography.headlineMedium,
    ).animateShimmer();
  }
}

class ProductSizeSelector extends StatelessWidget {
  final List<String> avaliableSizes;

  const ProductSizeSelector({required this.avaliableSizes});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        avaliableSizes.length,
        (index) => Container(
          padding: EdgeInsets.symmetric(horizontal: Spacing.s5.r),
          margin: EdgeInsets.all(Spacing.s5.r),
          decoration: ShapeDecoration(
            shape: const ContinuousRectangleBorder(),
            color: context.colors.primary0,
            shadows: [AppShadow.outerShadow],
          ),
          child: Text(
            avaliableSizes[index],
            style: context.typography.titleLarge,
          ),
        ),
      ),
    );
  }
}

class ProductPriceAndCart extends StatelessWidget {
  final ProductModel product;

  const ProductPriceAndCart({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            'Price',
            style: context.typography.titleMedium.copyWith(
              color: context.colors.primary5,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Text(
                  '${NumberFormat('#,###', 'en').format(product.priceAfter)}جم',
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.bodyLarge.copyWith(
                    color: context.colors.primary9,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Text(
                  '${NumberFormat('#,###', 'en').format(product.priceBefore)}جم',
                  style: context.typography.labelLarge.copyWith(
                    color: context.colors.primary5,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        DefaultButtonWidget(
          label: 'Add to Cart',
          onPressed: () {},
          width: AppReference.deviceWidth(context) * 0.5,
        ),
      ],
    );
  }
}
