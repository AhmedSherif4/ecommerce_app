part of '../../cart.dart';
abstract class CartBaseRepository{
  
}

@LazySingleton(as: CartBaseRepository)
class CartRepository implements CartBaseRepository{
  final  CartRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  CartRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}