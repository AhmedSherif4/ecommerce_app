part of '../../home.dart';

abstract class HomeBaseRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();

  Future<Either<Failure, List<ProductEntity>>> getAllProducts({
    required GetAllProductsRequest getAllProductsRequest,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required GetProductsByCategoryRequest getProductsByCategoryRequest,
  });

  Future<Either<Failure, List<ProductEntity>>> filterProducts({
    required FilterProductsRequest filterProductsRequest,
  });
}

@LazySingleton(as: HomeBaseRepository)
class HomeRepository implements HomeBaseRepository {
  final HomeRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;

  HomeRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    final jsonFromRemoteData = remoteDataSource.getAllCategories();
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({
    required GetAllProductsRequest getAllProductsRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.getAllProducts(
      getAllProductsRequest: getAllProductsRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required GetProductsByCategoryRequest getProductsByCategoryRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.getProductsByCategory(
      getProductsByCategoryRequest: getProductsByCategoryRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> filterProducts({
    required FilterProductsRequest filterProductsRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.filterProducts(
      filterProductsRequest: filterProductsRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }
}
