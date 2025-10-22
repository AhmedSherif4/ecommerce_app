part of '../../details_product.dart';
abstract class DetailsProductBaseRepository{
  
}

@LazySingleton(as: DetailsProductBaseRepository)
class DetailsProductRepository implements DetailsProductBaseRepository{
  final  DetailsProductRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  DetailsProductRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}