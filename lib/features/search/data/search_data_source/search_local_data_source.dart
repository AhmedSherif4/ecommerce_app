part of '../../search.dart';

abstract class SearchLocalDataSource{

}
@LazySingleton(as: SearchLocalDataSource)
class SearchLocalDataSourceImpl implements SearchLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  SearchLocalDataSourceImpl({required this.baseLocalDataSource});
}