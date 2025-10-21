part of '../../account.dart';

abstract class AccountLocalDataSource{

}
@LazySingleton(as: AccountLocalDataSource)
class AccountLocalDataSourceImpl implements AccountLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  AccountLocalDataSourceImpl({required this.baseLocalDataSource});
}