part of '../../address.dart';

abstract class AddressLocalDataSource{

}
@LazySingleton(as: AddressLocalDataSource)
class AddressLocalDataSourceImpl implements AddressLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  AddressLocalDataSourceImpl({required this.baseLocalDataSource});
}