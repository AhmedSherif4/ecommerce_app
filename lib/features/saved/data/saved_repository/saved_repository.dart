part of '../../saved.dart';

abstract class SavedBaseRepository {
  Future<Either<Failure, List<ProductEntity>>> getUserFavorites({
    required GetUserFavoritesRequest getUserFavoritesRequest,
  });

  Future<Either<Failure, List<ProductEntity>>> addToFavorites({
    required AddToFavoritesRequest addToFavoritesRequest,
  });

  Future<Either<Failure, List<ProductEntity>>> removeFromFavorites({
    required RemoveFromFavoritesRequest removeFromFavoritesRequest,
  });
}

@LazySingleton(as: SavedBaseRepository)
class SavedRepository implements SavedBaseRepository {
  final SavedRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;

  SavedRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> getUserFavorites({
    required GetUserFavoritesRequest getUserFavoritesRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.getUserFavorites(
      getUserFavoritesRequest: getUserFavoritesRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> addToFavorites({
    required AddToFavoritesRequest addToFavoritesRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.addToFavorites(
      addToFavoritesRequest: addToFavoritesRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> removeFromFavorites({
    required RemoveFromFavoritesRequest removeFromFavoritesRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.removeFromFavorites(
      removeFromFavoritesRequest: removeFromFavoritesRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }
}
