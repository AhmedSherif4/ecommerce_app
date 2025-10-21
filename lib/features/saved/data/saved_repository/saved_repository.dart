part of '../../saved.dart';
abstract class SavedBaseRepository{
  
}

@LazySingleton(as: SavedBaseRepository)
class SavedRepository implements SavedBaseRepository{
  final  SavedRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  SavedRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}