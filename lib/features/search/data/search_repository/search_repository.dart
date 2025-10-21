part of '../../search.dart';
abstract class SearchBaseRepository{
  
}

@LazySingleton(as: SearchBaseRepository)
class SearchRepository implements SearchBaseRepository{
  final  SearchRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  SearchRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}