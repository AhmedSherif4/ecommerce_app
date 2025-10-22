part of '../../address.dart';
abstract class AddressBaseRepository{
  
}

@LazySingleton(as: AddressBaseRepository)
class AddressRepository implements AddressBaseRepository{
  final  AddressRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  AddressRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}