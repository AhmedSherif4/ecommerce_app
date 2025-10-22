part of '../search.dart';

class SearchState extends Equatable {
  final String value;
  final List<String> recentSearches;
  final List<ProductModel> searchedProducts;
  final bool showRecent;
  final bool noResultsFound;

  const SearchState({
    this.value = '',
    this.recentSearches = const [],
    this.searchedProducts = const [],
    this.showRecent = true,
    this.noResultsFound = false,
  });

  SearchState copyWith({
    String? value,
    List<String>? recentSearches,
    List<ProductModel>? searchedProducts,
    bool? showRecent,
    bool? noResultsFound,
  }) {
    return SearchState(
      value: value ?? this.value,
      recentSearches: recentSearches ?? this.recentSearches,
      searchedProducts: searchedProducts ?? this.searchedProducts,
      showRecent: showRecent ?? this.showRecent,
      noResultsFound: noResultsFound ?? this.noResultsFound,
    );
  }

  @override
  List<Object> get props => [
    value,
    recentSearches,
    searchedProducts,
    showRecent,
    noResultsFound,
  ];
}
