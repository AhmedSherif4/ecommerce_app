part of '../../faqs.dart';

abstract class FaqsLocalDataSource{

}
@LazySingleton(as: FaqsLocalDataSource)
class FaqsLocalDataSourceImpl implements FaqsLocalDataSource{
  final BaseLocalDataSource baseLocalDataSource;

  FaqsLocalDataSourceImpl({required this.baseLocalDataSource});
}