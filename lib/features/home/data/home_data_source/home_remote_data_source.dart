part of '../../home.dart';

abstract class HomeRemoteDataSource {
  Future<GetAllCategoriesResponseModel> getAllCategories();

  Future<GetAllProductsResponseModel> getAllProducts({
    required GetAllProductsRequest getAllProductsRequest,
  });

  Future<GetAllProductsResponseModel> getProductsByCategory({
    required GetProductsByCategoryRequest getProductsByCategoryRequest,
  });

  Future<GetAllProductsResponseModel> filterProducts({
    required FilterProductsRequest filterProductsRequest,
  });
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;

  HomeRemoteDataSourceImpl({required this.baseDataSource});
  @override
  Future<GetAllCategoriesResponseModel> getAllCategories() async {
    final response = await baseDataSource.postData(
      url: EndPoints.getAllCategories,
      body: {},
    );
    return GetAllCategoriesResponseModel.fromJson(response);
  }

  @override
  Future<GetAllProductsResponseModel> getAllProducts({
    required GetAllProductsRequest getAllProductsRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.getAllProducts(
        getAllProductsRequest.page,
        getAllProductsRequest.limitPerPage,
      ),
      body: {},
    );
    return GetAllProductsResponseModel.fromJson(response);
  }

  @override
  Future<GetAllProductsResponseModel> getProductsByCategory({
    required GetProductsByCategoryRequest getProductsByCategoryRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.getAllProductsByCategory(
        getProductsByCategoryRequest.categoryId,
        getProductsByCategoryRequest.page,
        getProductsByCategoryRequest.limitPerPage,
      ),
      body: {"category_id": getProductsByCategoryRequest.categoryId},
    );
    return GetAllProductsResponseModel.fromJson(response);
  }

  @override
  Future<GetAllProductsResponseModel> filterProducts({
    required FilterProductsRequest filterProductsRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.filterProducts,
      body: filterProductsRequest.toJson(),
    );
    return GetAllProductsResponseModel.fromJson(response);
  }
}
