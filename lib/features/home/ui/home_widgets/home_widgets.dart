part of '../../home.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rDetailsProductScreen,
          arguments: product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none, // علشان الزرار يطلع برا حدود الStack

        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: context.colors.primary2),
                borderRadius: BorderRadius.circular(
                  AppBorders.appBorderWidthR7,
                ),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppBorders.appBorderWidthR7),
                        topRight: Radius.circular(AppBorders.appBorderWidthR7),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: NullableNetworkImage(
                        imagePath: product.imageUrl,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.7,
                        fit: BoxFit.fill,
                        notHaveImage: product.imageUrl.isEmpty,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: Text(
                        product.name,
                        style: context.typography.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ).paddingBody(horizontal: 8, vertical: 0),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                          '${NumberFormat('#,###', 'en').format(product.priceAfterOffer)}جم/',
                                      style: context.typography.bodyLarge
                                          .copyWith(color: context.colors.red),
                                    ),
                                    TextSpan(
                                      text:
                                          '${NumberFormat('#,###', 'en').format(product.price)}جم',
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
                          CustomInkWell(
                            onTap: () {
                              if (product.isFavorite) {
                                context.read<SavedBloc>().add(
                                  RemoveFromFavoritesEvent(
                                    removeFromFavoritesRequest:
                                        RemoveFromFavoritesRequest(
                                          productId: product.id,
                                        ),
                                  ),
                                );
                              } else {
                                context.read<SavedBloc>().add(
                                  AddToFavoritesEvent(
                                    addToFavoritesRequest:
                                        AddToFavoritesRequest(
                                          productId: product.id,
                                        ),
                                  ),
                                );
                              }
                            },
                            child: SvgPicture.asset(
                              product.isFavorite
                                  ? Assets.projectIconHeartFilled
                                  : Assets.projectIconHeart,
                              width: Spacing.iconSizeS24,
                              height: Spacing.iconSizeS24,
                            ),
                          ),
                        ],
                      ).paddingBody(horizontal: 8, vertical: 0),
                    ),
                  ],
                );
              },
            ),
          ),
          // if (product.hasOffer)
          Positioned(
            top: -10,
            right: -10,
            child: SvgPicture.asset(
              Assets.iconsOffer,
              width: Spacing.iconSizeS24,
              height: Spacing.iconSizeS24,
            ),
          ),
        ],
      ),
    );
  }
}
