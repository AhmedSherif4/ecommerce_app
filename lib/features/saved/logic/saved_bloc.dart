part of '../saved.dart';

@Injectable()
class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedBaseRepository repository;

  SavedBloc(this.repository) : super(const SavedState()) {
    on<GetUserFavoritesEvent>(_getUserFavorites);
    on<AddToFavoritesEvent>(_addToFavorites);
    on<RemoveFromFavoritesEvent>(_removeFromFavorites);
    on<LoadMoreFavoritesEvent>(_loadMoreFavorites);
  }

  void _getUserFavorites(
    GetUserFavoritesEvent event,
    Emitter<SavedState> emit,
  ) async {
    emit(
      state.copyWith(
        getUserFavoritesState: RequestStates.loading,
        currentPage: 1,
        hasMore: true,
      ),
    );

    final result = await repository.getUserFavorites(
      getUserFavoritesRequest: event.getUserFavoritesRequest,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getUserFavoritesState: RequestStates.error,
            getUserFavoritesMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            getUserFavoritesState: RequestStates.loaded,
            favoriteProducts: products,
            getUserFavoritesMessage: 'Favorites loaded successfully',
            hasMore:
                products.length >= event.getUserFavoritesRequest.limitPerPage,
          ),
        );
      },
    );
  }

  void _addToFavorites(
    AddToFavoritesEvent event,
    Emitter<SavedState> emit,
  ) async {
    emit(state.copyWith(addToFavoritesState: RequestStates.loading));

    final result = await repository.addToFavorites(
      addToFavoritesRequest: event.addToFavoritesRequest,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            addToFavoritesState: RequestStates.error,
            addToFavoritesMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            addToFavoritesState: RequestStates.loaded,
            favoriteProducts: products,
            addToFavoritesMessage: 'Added to favorites successfully',
          ),
        );
      },
    );
  }

  void _removeFromFavorites(
    RemoveFromFavoritesEvent event,
    Emitter<SavedState> emit,
  ) async {
    emit(state.copyWith(removeFromFavoritesState: RequestStates.loading));

    final result = await repository.removeFromFavorites(
      removeFromFavoritesRequest: event.removeFromFavoritesRequest,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            removeFromFavoritesState: RequestStates.error,
            removeFromFavoritesMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            removeFromFavoritesState: RequestStates.loaded,
            favoriteProducts: products,
            removeFromFavoritesMessage: 'Removed from favorites successfully',
          ),
        );
      },
    );
  }

  void _loadMoreFavorites(
    LoadMoreFavoritesEvent event,
    Emitter<SavedState> emit,
  ) async {
    if (!state.hasMore || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final result = await repository.getUserFavorites(
      getUserFavoritesRequest: GetUserFavoritesRequest(
        page: nextPage,
        limitPerPage: 20,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoadingMore: false));
      },
      (newProducts) {
        final allProducts = [...state.favoriteProducts, ...newProducts];
        emit(
          state.copyWith(
            favoriteProducts: allProducts,
            currentPage: nextPage,
            hasMore: newProducts.length >= 20,
            isLoadingMore: false,
          ),
        );
      },
    );
  }
}
