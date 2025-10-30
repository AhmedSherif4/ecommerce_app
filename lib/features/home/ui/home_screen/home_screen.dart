part of '../../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bool tablet = AppReference.deviceIsTablet;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(context),
            _buildStickyHeader(context),
            _buildProductGrid(context, tablet),
          ],
        ),
      ),
    );
  }

  /// =======================
  /// SliverAppBar Section
  /// =======================
  Widget _buildSliverAppBar(BuildContext context) {
    final bool tablet = AppReference.deviceIsTablet;

    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: tablet ? 230 : 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBarHeader(context),
            Spacing.spaceHS10,
            _buildSearchAndFilterRow(context),
          ],
        ).paddingBody(vertical: 20),
      ),
    );
  }

  Widget _buildAppBarHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.discover,
          style: context.typography.titleLarge.copyWith(fontSize: 32.f),
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
    );
  }

  final TextEditingController _controller = TextEditingController();

  Widget _buildSearchAndFilterRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchField(
            controller: _controller,
            onComplete: () {
              context.read<SearchBloc>().add(
                ChangeSearchValueEvent(_controller.text),
              );
              context.read<HomeLayoutBloc>().add(
                ChangeBottomNavBarIndexEvent(1),
              );
            },
          ),
        ),
        Spacing.spaceSW5,
        CustomInkWell(
          onTap: () async => await FilterBottomSheet.show(context),
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
    );
  }

  /// =======================
  /// Sticky Header
  /// =======================
  Widget _buildStickyHeader(BuildContext context) {
    return SliverPersistentHeader(
      pinned: AppReference.isPortrait(context),
      delegate: _StickyHorizontalListDelegate(),
    );
  }

  /// =======================
  /// Product Grid
  /// =======================
  Widget _buildProductGrid(BuildContext context, bool tablet) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.products != current.products ||
          previous.getAllProductsState != current.getAllProductsState ||
          previous.getProductsByCategoryState !=
              current.getProductsByCategoryState ||
          previous.filterProductsState != current.filterProductsState,
      builder: (context, state) {
        if (_isLoading(state)) {
          return SliverFillRemaining(
            child: LoadingShimmerList(
              height: AppReference.deviceHeight(context) * 0.15,
            ),
          );
        }

        if (_hasError(state)) {
          return SliverFillRemaining(
            child: EmptyListWidgets(message: _errorMessage(state)),
          );
        }

        final finalProducts = state.products;
        if (finalProducts.isEmpty) {
          return const SliverFillRemaining(
            child: EmptyListWidgets(message: 'لا توجد منتجات'),
          );
        }

        return _buildProductGridSliver(finalProducts, context, tablet);
      },
    );
  }

  bool _isLoading(HomeState state) =>
      state.getAllProductsState == RequestStates.loading ||
      state.getProductsByCategoryState == RequestStates.loading;

  bool _hasError(HomeState state) =>
      state.getAllProductsState == RequestStates.error ||
      state.getProductsByCategoryState == RequestStates.error;

  String _errorMessage(HomeState state) {
    if (state.getAllProductsState == RequestStates.error) {
      return state.getAllProductsMessage;
    }
    return state.getProductsByCategoryMessage;
  }

  Widget _buildProductGridSliver(
    List<ProductEntity> finalProducts,
    BuildContext context,
    bool tablet,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppConstants.appPaddingR20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = finalProducts[index];
            return ProductCard(product: product);
          },
          childCount: finalProducts.length,
          findChildIndexCallback: (Key key) {
            final valueKey = key as ValueKey;
            return finalProducts.indexWhere((p) => p.id == valueKey.value);
          },
          addRepaintBoundaries: true,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: tablet ? 3 : 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: AppReference.isPortrait(context) ? 0.7 : 0.9,
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
      child: const CategoriesListWidget(),
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

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.categories.length,
          itemBuilder: (context, index) {
            bool isSelected = state.selectedCategoryIndex == index;
            String categoryName = state.categories[index].name;

            return GestureDetector(
              onTap: () {
                // Trigger events based on selection
                if (index == 0) {
                  // "All" category - get all products
                  context.read<HomeBloc>().add(
                    const GetAllProductsEvent(
                      getAllProductsRequest: GetAllProductsRequest(),
                    ),
                  );
                } else {
                  // Specific category - get products by category
                  context.read<HomeBloc>().add(
                    GetProductsByCategoryEvent(
                      getProductsByCategoryRequest:
                          GetProductsByCategoryRequest(
                            categoryId: state.categories[index].id,
                          ),
                      selectedCategoryIndex: index,
                    ),
                  );
                }
              },
              child: Container(
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
                alignment: Alignment.center,
                child: Text(
                  categoryName,
                  style: context.typography.bodyMedium.copyWith(
                    color: isSelected
                        ? context.colors.primary0
                        : context.colors.primary9,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomSearchField extends StatefulWidget {
  final Function() onComplete;
  final Function(bool)? emptyText;
  final TextEditingController controller;

  const CustomSearchField({
    super.key,
    required this.onComplete,
    this.emptyText,
    required this.controller,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
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
          switch (widget.emptyText) {
            case _?:
              if (value.isEmpty) {
                widget.emptyText!(true);
              } else {
                widget.emptyText!(false);
              }
          }
        },
        onEditingComplete: widget.onComplete,
        cursorColor: context.colors.primary9,
        controller: widget.controller,
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
            onTap: widget.onComplete,
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
