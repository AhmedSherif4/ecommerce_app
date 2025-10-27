part of '../../help_center.dart';
abstract class HelpCenterBaseRepository{
  
}

@LazySingleton(as: HelpCenterBaseRepository)
class HelpCenterRepository implements HelpCenterBaseRepository{
  final  HelpCenterRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  HelpCenterRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}