part of '../../my_orders.dart';

abstract class MyOrdersLocalDataSource{

}
@LazySingleton(as: MyOrdersLocalDataSource)
class MyOrdersLocalDataSourceImpl implements MyOrdersLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  MyOrdersLocalDataSourceImpl({required this.baseLocalDataSource});
}