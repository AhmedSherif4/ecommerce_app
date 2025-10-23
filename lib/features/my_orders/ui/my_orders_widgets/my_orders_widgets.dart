part of '../../my_orders.dart';

class _ProductCardCart extends StatelessWidget {
  final bool isCompleted;

  const _ProductCardCart({required this.isCompleted});

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
                    imagePath:
                        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
                    notHaveImage: false,
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 1,
                              children: [
                                Text(
                                  'Regular Fit Slogan',
                                  style: context.typography.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Size L',
                                  style: context.typography.caption.copyWith(
                                    color: context.colors.primary5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: ShapeDecoration(
                              color: isCompleted
                                  ? Color(0x190C9409)
                                  : context.colors.primary1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            child: Text(
                              isCompleted ? 'Completed' : 'In Transit',
                              style: context.typography.caption.copyWith(
                                color: isCompleted
                                    ? context.colors.green
                                    : context.colors.primary9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ 1,190',
                            style: context.typography.bodyMedium,
                          ),
                          DefaultButtonWidget(
                            label: isCompleted ? 'Leave Review' : 'Track Order',
                            onPressed: isCompleted ? () {} : () {},
                            textStyle: context.typography.caption.copyWith(
                              color: context.colors.primary0,
                            ),
                          ),
                        ],
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
