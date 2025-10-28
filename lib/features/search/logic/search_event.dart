part of '../search.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

// 🔍 Search Products Events (الجديدة)
class SearchProductsEvent extends SearchEvent {
  final SearchProductsRequest searchProductsRequest;

  const SearchProductsEvent({required this.searchProductsRequest});

  @override
  List<Object> get props => [searchProductsRequest];
}

class ChangeSearchValueEvent extends SearchEvent {
  final String value;

  const ChangeSearchValueEvent(this.value);

  @override
  List<Object> get props => [value];
}

class ClearRecentSearchesEvent extends SearchEvent {
  const ClearRecentSearchesEvent();

  @override
  List<Object> get props => [];
}

class EmptyTextEvent extends SearchEvent {
  const EmptyTextEvent();

  @override
  List<Object> get props => [];
}
