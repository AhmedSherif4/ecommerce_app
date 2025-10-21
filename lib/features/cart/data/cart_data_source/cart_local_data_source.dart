part of '../../cart.dart';

abstract class CartLocalDataSource{

}
@LazySingleton(as: CartLocalDataSource)
class CartLocalDataSourceImpl implements CartLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  CartLocalDataSourceImpl({required this.baseLocalDataSource});
}