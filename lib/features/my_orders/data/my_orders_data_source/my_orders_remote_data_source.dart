part of '../../my_orders.dart';

abstract class MyOrdersRemoteDataSource{

}

@LazySingleton(as: MyOrdersRemoteDataSource)
class MyOrdersRemoteDataSourceImpl implements MyOrdersRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  MyOrdersRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _MyOrdersParameter extends Equatable{


 const  _MyOrdersParameter(
    
  );
    @override
  List<Object> get props => [];
}
