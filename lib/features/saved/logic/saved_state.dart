part of '../saved.dart';

class SavedState extends Equatable {
  // Get User Favorites
  final RequestStates getUserFavoritesState;
  final List<ProductEntity> favoriteProducts;
  final String getUserFavoritesMessage;

  // Add to Favorites
  final RequestStates addToFavoritesState;
  final String addToFavoritesMessage;

  // Remove from Favorites
  final RequestStates removeFromFavoritesState;
  final String removeFromFavoritesMessage;

  // Pagination
  final bool hasMore;
  final int currentPage;
  final bool isLoadingMore;

  const SavedState({
    this.getUserFavoritesState = RequestStates.initial,
    this.favoriteProducts = const [],
    this.getUserFavoritesMessage = '',
    this.addToFavoritesState = RequestStates.initial,
    this.addToFavoritesMessage = '',
    this.removeFromFavoritesState = RequestStates.initial,
    this.removeFromFavoritesMessage = '',
    this.hasMore = true,
    this.currentPage = 1,
    this.isLoadingMore = false,
  });

  SavedState copyWith({
    RequestStates? getUserFavoritesState,
    List<ProductEntity>? favoriteProducts,
    String? getUserFavoritesMessage,
    RequestStates? addToFavoritesState,
    String? addToFavoritesMessage,
    RequestStates? removeFromFavoritesState,
    String? removeFromFavoritesMessage,
    bool? hasMore,
    int? currentPage,
    bool? isLoadingMore,
  }) {
    return SavedState(
      getUserFavoritesState:
          getUserFavoritesState ?? this.getUserFavoritesState,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      getUserFavoritesMessage:
          getUserFavoritesMessage ?? this.getUserFavoritesMessage,
      addToFavoritesState: addToFavoritesState ?? this.addToFavoritesState,
      addToFavoritesMessage:
          addToFavoritesMessage ?? this.addToFavoritesMessage,
      removeFromFavoritesState:
          removeFromFavoritesState ?? this.removeFromFavoritesState,
      removeFromFavoritesMessage:
          removeFromFavoritesMessage ?? this.removeFromFavoritesMessage,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    getUserFavoritesState,
    favoriteProducts,
    getUserFavoritesMessage,
    addToFavoritesState,
    addToFavoritesMessage,
    removeFromFavoritesState,
    removeFromFavoritesMessage,
    hasMore,
    currentPage,
    isLoadingMore,
  ];
}
