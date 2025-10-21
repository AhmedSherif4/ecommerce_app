part of '../../home.dart';

abstract class HomeRemoteDataSource{

}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  HomeRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _HomeParameter extends Equatable{


 const  _HomeParameter(
    
  );
    @override
  List<Object> get props => [];
}
