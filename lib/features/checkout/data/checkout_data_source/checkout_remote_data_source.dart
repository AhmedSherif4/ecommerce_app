part of '../../checkout.dart';

abstract class CheckoutRemoteDataSource{

}

@LazySingleton(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  CheckoutRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _CheckoutParameter extends Equatable{


 const  _CheckoutParameter(
    
  );
    @override
  List<Object> get props => [];
}
