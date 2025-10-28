part of '../search.dart';

class SearchState extends Equatable {
  final RequestStates searchProductsState;
  final List<ProductEntity> searchedProducts;
  final String searchProductsMessage;
  final String searchQuery;
  final List<String> recentSearches;
  final bool showRecent;
  final bool noResultsFound;

  const SearchState({
    this.searchProductsState = RequestStates.initial,
    this.searchedProducts = const [],
    this.searchProductsMessage = '',
    this.searchQuery = '',
    this.recentSearches = const [],
    this.showRecent = true,
    this.noResultsFound = false,
  });

  SearchState copyWith({
    RequestStates? searchProductsState,
    List<ProductEntity>? searchedProducts,
    String? searchProductsMessage,
    String? searchQuery,
    List<String>? recentSearches,
    bool? showRecent,
    bool? noResultsFound,
  }) {
    return SearchState(
      searchProductsState: searchProductsState ?? this.searchProductsState,
      searchedProducts: searchedProducts ?? this.searchedProducts,
      searchProductsMessage:
          searchProductsMessage ?? this.searchProductsMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      recentSearches: recentSearches ?? this.recentSearches,
      showRecent: showRecent ?? this.showRecent,
      noResultsFound: noResultsFound ?? this.noResultsFound,
    );
  }

  @override
  List<Object> get props => [
    searchProductsState,
    searchedProducts,
    searchProductsMessage,
    searchQuery,
    recentSearches,
    showRecent,
    noResultsFound,
  ];
}
