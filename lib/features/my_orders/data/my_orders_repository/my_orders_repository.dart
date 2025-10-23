part of '../../my_orders.dart';
abstract class MyOrdersBaseRepository{
  
}

@LazySingleton(as: MyOrdersBaseRepository)
class MyOrdersRepository implements MyOrdersBaseRepository{
  final  MyOrdersRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  MyOrdersRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}