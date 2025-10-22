part of '../../saved.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderForMore(title: AppStrings.saved),
              BlocBuilder<SavedCubit, SavedState>(
                builder: (context, state) {
                  state.favourites.log();
                  state.favouriteState.log();
                  switch (state.favouriteState) {
                    case RequestStates.loaded:
                      switch (state.favourites.isEmpty) {
                        case true:
                          return EmptyListWidgets(message: 'No Saved Items!');
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
                            itemCount: state.favourites.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.favourites[index],
                              );
                            },
                          );
                      }

                    case RequestStates.loading:
                      return LoadingShimmerList();
                    case RequestStates.error:
                      return Center(child: Text(state.errorMessage ?? ''));
                    default:
                      return SizedBox.shrink();
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
