part of '../../search.dart';

abstract class SearchRemoteDataSource{

}

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  SearchRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _SearchParameter extends Equatable{


 const  _SearchParameter(
    
  );
    @override
  List<Object> get props => [];
}
