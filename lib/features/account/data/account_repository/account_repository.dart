part of '../../account.dart';
abstract class AccountBaseRepository{
  
}

@LazySingleton(as: AccountBaseRepository)
class AccountRepository implements AccountBaseRepository{
  final  AccountRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  AccountRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}