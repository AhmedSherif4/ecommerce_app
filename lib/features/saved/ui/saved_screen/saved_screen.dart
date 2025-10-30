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
              const HeaderForMore(
                title: AppStrings.saved,
                hasBack: false,
              ).paddingBody(),
              BlocConsumer<SavedBloc, SavedState>(
                listener: _handleBlocListener,
                builder: (context, state) => _buildBody(context, state),
              ),
            ],
          ),
        ),
      ).paddingBody(horizontal: 25),
    );
  }

  // =============================
  // 📍 Bloc Listener
  // =============================
  void _handleBlocListener(BuildContext context, SavedState state) {
    final loading =
        state.addToFavoritesState == RequestStates.loading ||
        state.removeFromFavoritesState == RequestStates.loading;

    if (loading) {
      showLoadingDialog(context);
      return;
    }

    if (state.addToFavoritesState == RequestStates.loaded) {
      _showSnackAndPop(
        context,
        state.addToFavoritesMessage,
        ToastStates.congrats,
      );
    }

    if (state.removeFromFavoritesState == RequestStates.loaded) {
      _showSnackAndPop(
        context,
        state.removeFromFavoritesMessage,
        ToastStates.warning,
      );
    }
  }

  void _showSnackAndPop(
    BuildContext context,
    String message,
    ToastStates state,
  ) {
    RouteManager.rPopRoute(context);
    showSnackBar(description: message, state: state, context: context);
  }

  // =============================
  // 📍 Body Builder
  // =============================
  Widget _buildBody(BuildContext context, SavedState state) {
    switch (state.getUserFavoritesState) {
      case RequestStates.loading:
        return const LoadingShimmerList();

      case RequestStates.error:
        return _buildErrorState(context, state.getUserFavoritesMessage);

      case RequestStates.loaded:
        return state.favoriteProducts.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: const Center(
                  child: EmptyListWidgets(message: 'No Saved Items!'),
                ),
              )
            : _buildGridView(context, state);

      default:
        return const SizedBox.shrink();
    }
  }

  // =============================
  // 📍 Error State
  // =============================
  Widget _buildErrorState(BuildContext context, String message) {
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
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<SavedBloc>().add(
                const GetUserFavoritesEvent(
                  getUserFavoritesRequest: GetUserFavoritesRequest(
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
  }

  // =============================
  // 📍 Grid View
  // =============================
  Widget _buildGridView(BuildContext context, SavedState state) {
    final crossAxisCount = AppReference.deviceIsTablet ? 3 : 2;
    final aspectRatio = AppReference.isPortrait(context) ? 0.7 : 0.9;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: aspectRatio,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.favoriteProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(product: state.favoriteProducts[index]);
      },
    );
  }
}
