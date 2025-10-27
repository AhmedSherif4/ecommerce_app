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
  final int selectedCategoryIndex;

  const GetAllProductsEvent({
    required this.getAllProductsRequest,
    this.selectedCategoryIndex = 0,
  });

  @override
  List<Object> get props => [getAllProductsRequest];
}

class GetProductsByCategoryEvent extends HomeEvent {
  final GetProductsByCategoryRequest getProductsByCategoryRequest;
  final int selectedCategoryIndex;

  const GetProductsByCategoryEvent({
    required this.getProductsByCategoryRequest,
    required this.selectedCategoryIndex,
  });

  @override
  List<Object> get props => [
    getProductsByCategoryRequest,
    selectedCategoryIndex,
  ];
}

class FilterProductsEvent extends HomeEvent {
  const FilterProductsEvent();

  @override
  List<Object> get props => [];
}

class SelectSortEvent extends HomeEvent {
  final FilterSortTypes selectedSort;
  const SelectSortEvent(this.selectedSort);
  @override
  List<Object> get props => [selectedSort];
}

class UpdateRangeEvent extends HomeEvent {
  final RangeValues rangeValues;
  const UpdateRangeEvent(this.rangeValues);
  @override
  List<Object> get props => [rangeValues];
}
