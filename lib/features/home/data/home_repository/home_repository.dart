part of '../../home.dart';
abstract class HomeBaseRepository{
  
}

@LazySingleton(as: HomeBaseRepository)
class HomeRepository implements HomeBaseRepository{
  final  HomeRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  HomeRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}