part of '../../address.dart';

abstract class AddressRemoteDataSource{

}

@LazySingleton(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  AddressRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _AddressParameter extends Equatable{


 const  _AddressParameter(
    
  );
    @override
  List<Object> get props => [];
}
