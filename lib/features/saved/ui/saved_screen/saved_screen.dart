part of '../../saved.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const HeaderForMore(title: AppStrings.saved, hasBack: false),
              BlocConsumer<SavedBloc, SavedState>(
                listener: (context, state) {
                  // عرض رسالة عند الإضافة للـ favorites
                  if (state.addToFavoritesState == RequestStates.loaded) {
                    showSnackBar(
                      description: state.addToFavoritesMessage,
                      state: ToastStates.congrats,
                      context: context,
                    );
                  }

                  // عرض رسالة عند الحذف من الـ favorites
                  if (state.removeFromFavoritesState == RequestStates.loaded) {
                    showSnackBar(
                      description: state.removeFromFavoritesMessage,
                      state: ToastStates.warning,
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  switch (state.getUserFavoritesState) {
                    case RequestStates.loaded:
                      switch (state.favoriteProducts.isEmpty) {
                        case true:
                          return const EmptyListWidgets(
                            message: 'No Saved Items!',
                          );
                        case false:
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: AppReference.deviceIsTablet
                                      ? 3
                                      : 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio:
                                      AppReference.isPortrait(context)
                                      ? 0.7
                                      : 0.9,
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.favoriteProducts.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.favoriteProducts[index],
                              );
                            },
                          );
                      }

                    case RequestStates.loading:
                      return const LoadingShimmerList();

                    case RequestStates.error:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.getUserFavoritesMessage,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<SavedBloc>().add(
                                  const GetUserFavoritesEvent(
                                    getUserFavoritesRequest:
                                        GetUserFavoritesRequest(
                                          page: 1,
                                          limitPerPage: 20,
                                        ),
                                  ),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ).paddingBody(),
    );
  }
}
