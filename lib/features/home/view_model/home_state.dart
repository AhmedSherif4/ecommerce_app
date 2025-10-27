part of 'home_bloc.dart';

class HomeState extends Equatable {
  // Get All Categories
  final RequestStates getAllCategoriesState;
  final List<CategoryEntity> categories;
  final String getAllCategoriesMessage;

  // Get All Products
  final RequestStates getAllProductsState;
  final List<ProductEntity> products;
  final String getAllProductsMessage;

  // Get Products By Category
  final RequestStates getProductsByCategoryState;
  final List<ProductEntity> categoryProducts;
  final String getProductsByCategoryMessage;

  // Filter Products
  final RequestStates filterProductsState;
  final List<ProductEntity> filteredProducts;
  final String filterProductsMessage;

  const HomeState({
    this.getAllCategoriesState = RequestStates.initial,
    this.categories = const [],
    this.getAllCategoriesMessage = '',
    this.getAllProductsState = RequestStates.initial,
    this.products = const [],
    this.getAllProductsMessage = '',
    this.getProductsByCategoryState = RequestStates.initial,
    this.categoryProducts = const [],
    this.getProductsByCategoryMessage = '',
    this.filterProductsState = RequestStates.initial,
    this.filteredProducts = const [],
    this.filterProductsMessage = '',
  });

  HomeState copyWith({
    RequestStates? getAllCategoriesState,
    List<CategoryEntity>? categories,
    String? getAllCategoriesMessage,
    RequestStates? getAllProductsState,
    List<ProductEntity>? products,
    String? getAllProductsMessage,
    RequestStates? getProductsByCategoryState,
    List<ProductEntity>? categoryProducts,
    String? getProductsByCategoryMessage,
    RequestStates? filterProductsState,
    List<ProductEntity>? filteredProducts,
    String? filterProductsMessage,
  }) {
    return HomeState(
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
      categories: categories ?? this.categories,
      getAllCategoriesMessage:
          getAllCategoriesMessage ?? this.getAllCategoriesMessage,
      getAllProductsState: getAllProductsState ?? this.getAllProductsState,
      products: products ?? this.products,
      getAllProductsMessage:
          getAllProductsMessage ?? this.getAllProductsMessage,
      getProductsByCategoryState:
          getProductsByCategoryState ?? this.getProductsByCategoryState,
      categoryProducts: categoryProducts ?? this.categoryProducts,
      getProductsByCategoryMessage:
          getProductsByCategoryMessage ?? this.getProductsByCategoryMessage,
      filterProductsState: filterProductsState ?? this.filterProductsState,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      filterProductsMessage:
          filterProductsMessage ?? this.filterProductsMessage,
    );
  }

  @override
  List<Object?> get props => [
    getAllCategoriesState,
    categories,
    getAllCategoriesMessage,
    getAllProductsState,
    products,
    getAllProductsMessage,
    getProductsByCategoryState,
    categoryProducts,
    getProductsByCategoryMessage,
    filterProductsState,
    filteredProducts,
    filterProductsMessage,
  ];
}
