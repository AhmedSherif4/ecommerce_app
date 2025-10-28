part of '../../saved.dart';

abstract class SavedRemoteDataSource {
  Future<GetUserFavoritesResponseModel> getUserFavorites({
    required GetUserFavoritesRequest getUserFavoritesRequest,
  });

  Future<AddToFavoritesResponseModel> addToFavorites({
    required AddToFavoritesRequest addToFavoritesRequest,
  });

  Future<RemoveFromFavoritesResponseModel> removeFromFavorites({
    required RemoveFromFavoritesRequest removeFromFavoritesRequest,
  });
}

@LazySingleton(as: SavedRemoteDataSource)
class SavedRemoteDataSourceImpl implements SavedRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;

  SavedRemoteDataSourceImpl({required this.baseDataSource});

  @override
  Future<GetUserFavoritesResponseModel> getUserFavorites({
    required GetUserFavoritesRequest getUserFavoritesRequest,
  }) async {
    final response = await baseDataSource.postData(
      //todo: should be get not post
      url: EndPoints.getUserFavorites,
      body: getUserFavoritesRequest.toJson(),
    );
    return GetUserFavoritesResponseModel.fromJson(response);
  }

  @override
  Future<AddToFavoritesResponseModel> addToFavorites({
    required AddToFavoritesRequest addToFavoritesRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.addToFavorites,
      body: addToFavoritesRequest.toJson(),
    );
    return AddToFavoritesResponseModel.fromJson(response);
  }

  @override
  Future<RemoveFromFavoritesResponseModel> removeFromFavorites({
    required RemoveFromFavoritesRequest removeFromFavoritesRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.removeFromFavorites,
      body: removeFromFavoritesRequest.toJson(),
    );
    return RemoveFromFavoritesResponseModel.fromJson(response);
  }
}
