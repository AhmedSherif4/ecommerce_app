part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesEvent extends HomeEvent {
  const GetAllCategoriesEvent();
}

class GetAllProductsEvent extends HomeEvent {
  final GetAllProductsRequest getAllProductsRequest;

  const GetAllProductsEvent({required this.getAllProductsRequest});

  @override
  List<Object> get props => [getAllProductsRequest];
}

class GetProductsByCategoryEvent extends HomeEvent {
  final GetProductsByCategoryRequest getProductsByCategoryRequest;

  const GetProductsByCategoryEvent({
    required this.getProductsByCategoryRequest,
  });

  @override
  List<Object> get props => [getProductsByCategoryRequest];
}

class FilterProductsEvent extends HomeEvent {
  final FilterProductsRequest filterProductsRequest;

  const FilterProductsEvent({required this.filterProductsRequest});

  @override
  List<Object> get props => [filterProductsRequest];
}
