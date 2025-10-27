part of '../../help_center.dart';

abstract class HelpCenterLocalDataSource{

}
@LazySingleton(as: HelpCenterLocalDataSource)
class HelpCenterLocalDataSourceImpl implements HelpCenterLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  HelpCenterLocalDataSourceImpl({required this.baseLocalDataSource});
}