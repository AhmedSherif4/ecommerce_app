part of '../../account.dart';

abstract class AccountRemoteDataSource{

}

@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  AccountRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _AccountParameter extends Equatable{


 const  _AccountParameter(
    
  );
    @override
  List<Object> get props => [];
}
