part of '../../cart.dart';

abstract class CartRemoteDataSource{

}

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  CartRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _CartParameter extends Equatable{


 const  _CartParameter(
    
  );
    @override
  List<Object> get props => [];
}
