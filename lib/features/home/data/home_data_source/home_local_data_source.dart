part of '../../home.dart';

abstract class HomeLocalDataSource{

}
@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  HomeLocalDataSourceImpl({required this.baseLocalDataSource});
}