part of 'home_bloc.dart';

class HomeState extends Equatable {
  // Get All Categories
  final RequestStates getAllCategoriesState;
  final List<CategoryEntity> categories;
  final String getAllCategoriesMessage;
  final int selectedCategoryIndex;

  // Get All Products
  final RequestStates getAllProductsState;
  final List<ProductEntity> products;
  final String getAllProductsMessage;

  // Get Products By Category
  final RequestStates getProductsByCategoryState;
  final String getProductsByCategoryMessage;

  // Filter Products
  final RequestStates filterProductsState;
  final String filterProductsMessage;
  final FilterSortTypes selectedSortType;
  final RangeValues rangeValues;

  const HomeState({
    this.getAllCategoriesState = RequestStates.initial,
    this.categories = const [],
    this.getAllCategoriesMessage = '',
    this.selectedCategoryIndex = 0,
    this.getAllProductsState = RequestStates.initial,
    this.products = const [],
    this.getAllProductsMessage = '',
    this.getProductsByCategoryState = RequestStates.initial,
    this.getProductsByCategoryMessage = '',
    this.filterProductsState = RequestStates.initial,
    this.filterProductsMessage = '',
    this.selectedSortType = FilterSortTypes.relevance,
    this.rangeValues = const RangeValues(10, 10000),
  });

  HomeState copyWith({
    RequestStates? getAllCategoriesState,
    List<CategoryEntity>? categories,
    String? getAllCategoriesMessage,
    int? selectedCategoryIndex,
    RequestStates? getAllProductsState,
    List<ProductEntity>? products,
    String? getAllProductsMessage,
    RequestStates? getProductsByCategoryState,
    String? getProductsByCategoryMessage,
    RequestStates? filterProductsState,
    String? filterProductsMessage,
    FilterSortTypes? selectedSortType,
    RangeValues? rangeValues,
  }) {
    return HomeState(
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
      categories: categories ?? this.categories,
      getAllCategoriesMessage:
          getAllCategoriesMessage ?? this.getAllCategoriesMessage,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      getAllProductsState: getAllProductsState ?? this.getAllProductsState,
      products: products ?? this.products,
      getAllProductsMessage:
          getAllProductsMessage ?? this.getAllProductsMessage,
      getProductsByCategoryState:
          getProductsByCategoryState ?? this.getProductsByCategoryState,
      getProductsByCategoryMessage:
          getProductsByCategoryMessage ?? this.getProductsByCategoryMessage,
      filterProductsState: filterProductsState ?? this.filterProductsState,
      filterProductsMessage:
          filterProductsMessage ?? this.filterProductsMessage,
      selectedSortType: selectedSortType ?? this.selectedSortType,
      rangeValues: rangeValues ?? this.rangeValues,
    );
  }

  @override
  List<Object?> get props => [
    getAllCategoriesState,
    categories,
    getAllCategoriesMessage,
    selectedCategoryIndex,
    getAllProductsState,
    products,
    getAllProductsMessage,
    getProductsByCategoryState,
    getProductsByCategoryMessage,
    filterProductsState,
    filterProductsMessage,
    selectedSortType,
    rangeValues,
  ];
}
