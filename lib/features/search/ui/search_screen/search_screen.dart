part of '../../search.dart';

class SearchScreen extends StatefulWidget {
  final String value;
  const SearchScreen({super.key, required this.value});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  final bool tablet = AppReference.deviceIsTablet;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSearchHeader(context, cubit),

            // الحالة الديناميكية حسب الـ state
            BlocBuilder<SearchCubit, SearchState>(
              buildWhen: (p, c) =>
                  p.recentSearches != c.recentSearches ||
                  p.searchedProducts != c.searchedProducts ||
                  p.noResultsFound != c.noResultsFound ||
                  p.showRecent != c.showRecent,
              builder: (context, state) {
                if (state.showRecent) {
                  return _RecentSearchesSliver(
                    searches: state.recentSearches,
                    onTap: (search) {
                      _controller.text = search;
                      cubit.changeValue(search);
                    },
                    onClear: cubit.clearRecent,
                  );
                }

                if (state.noResultsFound) {
                  return const _EmptySliver(message: 'No results found 😢');
                }

                if (state.searchedProducts.isNotEmpty) {
                  return _ProductsSliver(products: state.searchedProducts);
                }

                // fallback في حالة الانتقال أو أول تحميل
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ).paddingBody(),
      ),
    );
  }

  // 🔹 رأس الصفحة (البحث)
  Widget _buildSearchHeader(BuildContext context, SearchCubit cubit) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: tablet ? 190 : 100,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderForMore(title: AppStrings.search, hasBack: false),
            Spacing.spaceHS10,
            Expanded(
              child: CustomSearchField(
                onSearchTap: (value) {
                  value.log();
                  cubit.changeValue(value);
                },
              ),
            ),
          ],
        ).paddingBody(vertical: 20),
      ),
    );
  }
}

// ----------------------
// 🔸 Recent Searches
// ----------------------
class _RecentSearchesSliver extends StatelessWidget {
  final List<String> searches;
  final ValueChanged<String> onTap;
  final VoidCallback onClear;

  const _RecentSearchesSliver({
    required this.searches,
    required this.onTap,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    if (searches.isEmpty) {
      return const _EmptySliver(message: 'No recent searches');
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Recent Searches',
                    style: context.typography.titleLarge,
                  ),
                ),
                TextButton(
                  onPressed: onClear,
                  child: Text(
                    'Clear All',
                    style: context.typography.bodyMedium.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final search = searches[index - 1];
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text(search),
          onTap: () => onTap(search),
        );
      }, childCount: searches.length + 1),
    );
  }
}

// ----------------------
// 🔸 Products List
// ----------------------
class _ProductsSliver extends StatelessWidget {
  final List<ProductModel> products;
  const _ProductsSliver({required this.products});

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat('#,###', 'en');

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.appPaddingR10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NullableNetworkImage(
                imagePath: product.image,
                height: Spacing.s50,
                width: Spacing.s50,
                notHaveImage: product.image.isEmpty,
                fit: BoxFit.contain,
              ),
              Spacing.spaceSW10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: context.typography.bodyLarge),
                    Spacing.spaceHS5,
                    Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: Text.rich(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${format.format(product.priceAfter)}جم/',
                              style: context.typography.caption.copyWith(
                                color: context.colors.red,
                              ),
                            ),
                            TextSpan(
                              text: '${format.format(product.priceBefore)}جم',
                              style: context.typography.caption.copyWith(
                                color: context.colors.primary5,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.spaceHS10,
                    Divider(color: context.colors.primary1, height: 1),
                  ],
                ),
              ),
            ],
          ),
        );
      }, childCount: products.length),
    );
  }
}

// ----------------------
// 🔸 Empty State
// ----------------------
class _EmptySliver extends StatelessWidget {
  final String message;
  const _EmptySliver({required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false, // ضروري علشان الويجت تتمدد لآخر الشاشة

      child: Center(child: EmptyListWidgets(message: message)),
    );
  }
}
