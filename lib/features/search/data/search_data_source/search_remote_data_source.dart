part of '../../search.dart';

abstract class SearchRemoteDataSource {
  Future<SearchProductsResponseModel> searchProducts({
    required SearchProductsRequest searchProductsRequest,
  });
}

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final BaseRemoteDataSource baseRemoteDataSource;

  SearchRemoteDataSourceImpl({required this.baseRemoteDataSource});
  @override
  Future<SearchProductsResponseModel> searchProducts({
    required SearchProductsRequest searchProductsRequest,
  }) async {
    final response = await baseRemoteDataSource.postData(
      url: EndPoints.searchProducts,
      body: searchProductsRequest.toJson(),
    );
    return SearchProductsResponseModel.fromJson(response);
  }
}

