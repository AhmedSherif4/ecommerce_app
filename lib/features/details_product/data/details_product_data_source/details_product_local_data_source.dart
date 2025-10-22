part of '../../details_product.dart';

abstract class DetailsProductLocalDataSource{

}
@LazySingleton(as: DetailsProductLocalDataSource)
class DetailsProductLocalDataSourceImpl implements DetailsProductLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  DetailsProductLocalDataSourceImpl({required this.baseLocalDataSource});
}