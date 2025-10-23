part of '../../home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool tablet = AppReference.deviceIsTablet;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// =======================
            /// SliverAppBar (الجزء اللي بيختفي)
            /// =======================
            SliverAppBar(
              pinned: false,
              floating: false,
              expandedHeight: tablet ? 230 : 150,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.discover,
                          style: context.typography.titleLarge.copyWith(
                            fontSize: 32.f,
                          ),
                        ),
                        CustomInkWell(
                          onTap: () {
                            RouteManager.rPushNamed(
                              context: context,
                              rName: AppRoutesNames.rNotificationScreen,
                            );
                          },
                          child: SvgPicture.asset(
                            Assets.projectIconBell,
                            height: Spacing.iconSizeS24,
                            width: Spacing.iconSizeS24,
                          ),
                        ),
                      ],
                    ),

                    Spacing.spaceHS10,

                    Row(
                      children: [
                        Expanded(
                          child: CustomSearchField(
                            onSearchTap: (value) {
                              value.log();
                              context.read<SearchCubit>().changeValue(value);
                              context.read<HomeLayoutBloc>().add(
                                ChangeBottomNavBarIndexEvent(1),
                              );
                            },
                          ),
                        ),
                        Spacing.spaceSW5,
                        CustomInkWell(
                          onTap: () async {
                            final result = await FilterBottomSheet.show(
                              context,
                            );
                            if (result != null) {
                              // هنا هترجع FilterState النهائية
                              print(
                                'Selected sort: ${result.selectedSortIndex}',
                              );
                              print(
                                'Price range: ${result.priceRange.start} - ${result.priceRange.end}',
                              );
                              print('Size: ${result.selectedSize}');
                              // طبق الفلاتر على البيانات بتاعتك
                            } else {
                              // المستخدم قفل الشيت بدون apply
                            }
                          },
                          child: Container(
                            width: Spacing.s50,
                            height: Spacing.s50,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: context.colors.primary9,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.projectIconFilter,
                              height: Spacing.iconSizeS24,
                              width: Spacing.iconSizeS24,
                              colorFilter: ColorFilter.mode(
                                context.colors.primary0,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingBody(vertical: 20),
              ),
            ),

            /// =======================
            /// SliverPersistentHeader (اللي بيثبت)
            /// =======================
            SliverPersistentHeader(
              pinned: AppReference.isPortrait(context) ? true : false,
              delegate: _StickyHorizontalListDelegate(),
            ),

            /// =======================
            /// SliverGrid (Responsive)
            /// =======================
            SliverPadding(
              padding: const EdgeInsets.all(AppConstants.appPaddingR20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: dummyProducts.length,
                  (context, index) {
                    List<ProductModel> products = dummyProducts;
                    return ProductCard(product: products[index]);
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: tablet ? 3 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: AppReference.isPortrait(context)
                      ? 0.7
                      : 0.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// Custom Delegate
/// =======================
class _StickyHorizontalListDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: context.colors.primary0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 8,
        itemBuilder: (context, index) {
          int selectedIndex = 2;
          bool isSelected = selectedIndex == index;
          return Container(
            width: Spacing.s100,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.appPaddingR10,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: AppConstants.appPaddingR10,
              vertical: AppConstants.appPaddingR20,
            ),
            decoration: ShapeDecoration(
              color: isSelected
                  ? context.colors.primary9
                  : context.colors.primary0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: isSelected
                      ? context.colors.primary0
                      : context.colors.primary1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            alignment: AlignmentGeometry.center,
            child: Text(
              'Item ${index + 1}',
              style: context.typography.bodyMedium.copyWith(
                color: isSelected
                    ? context.colors.primary0
                    : context.colors.primary9,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class CustomSearchField extends StatefulWidget {
  final Function(String text) onSearchTap;

  const CustomSearchField({super.key, required this.onSearchTap});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.s50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: context.colors.primary1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextFormField(
        onChanged: (value) {
          widget.onSearchTap(value);
        },
        cursorColor: context.colors.primary9,
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: AppConstants.appPaddingR20,
          ),
          isDense: true,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          prefixIcon: CustomInkWell(
            onTap: () {
              widget.onSearchTap(_controller.text);
            },
            child: SvgPicture.asset(
              Assets.projectIconSearchDuotone,
              height: Spacing.iconSizeS24,
              width: Spacing.iconSizeS24,
            ),
          ),
          hintFadeDuration: const Duration(seconds: 1),
          hintText: AppStrings.searchDescription,
          hintStyle: context.typography.bodyMedium.copyWith(
            color: context.colors.primary4,
          ),
        ),
      ),
    );
  }
}
