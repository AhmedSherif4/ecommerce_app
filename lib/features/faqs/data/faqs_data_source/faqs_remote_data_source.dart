part of '../../faqs.dart';

abstract class FaqsRemoteDataSource{

}

@LazySingleton(as: FaqsRemoteDataSource)
class FaqsRemoteDataSourceImpl implements FaqsRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  FaqsRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _FaqsParameter extends Equatable{


 const  _FaqsParameter(
    
  );
    @override
  List<Object> get props => [];
}
