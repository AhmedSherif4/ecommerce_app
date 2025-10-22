part of '../../checkout.dart';

abstract class CheckoutLocalDataSource{

}
@LazySingleton(as: CheckoutLocalDataSource)
class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  CheckoutLocalDataSourceImpl({required this.baseLocalDataSource});
}