part of '../../faqs.dart';
abstract class FaqsBaseRepository{
  
}

@LazySingleton(as: FaqsBaseRepository)
class FaqsRepository implements FaqsBaseRepository{
  final  FaqsRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  
  FaqsRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    //local data source if you want handle cached data.
  });

}