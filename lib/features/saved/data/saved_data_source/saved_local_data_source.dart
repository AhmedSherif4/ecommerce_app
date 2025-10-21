part of '../../saved.dart';

abstract class SavedLocalDataSource{

}
@LazySingleton(as: SavedLocalDataSource)
class SavedLocalDataSourceImpl implements SavedLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  SavedLocalDataSourceImpl({required this.baseLocalDataSource});
}