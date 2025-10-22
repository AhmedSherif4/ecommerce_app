part of '../../checkout.dart';
abstract class CheckoutBaseRepository{
  
}

@LazySingleton(as: CheckoutBaseRepository)
class CheckoutRepository implements CheckoutBaseRepository{
  final  CheckoutRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  CheckoutRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}