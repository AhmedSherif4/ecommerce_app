part of '../../search.dart';

abstract class SearchBaseRepository {
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required SearchProductsRequest searchProductsRequest,
  });
}

@LazySingleton(as: SearchBaseRepository)
class SearchRepository implements SearchBaseRepository {
  final SearchRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;

  SearchRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required SearchProductsRequest searchProductsRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.searchProducts(
      searchProductsRequest: searchProductsRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }
}
