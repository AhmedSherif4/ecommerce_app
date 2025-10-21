part of '../../saved.dart';

abstract class SavedRemoteDataSource{

}

@LazySingleton(as: SavedRemoteDataSource)
class SavedRemoteDataSourceImpl implements SavedRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  SavedRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _SavedParameter extends Equatable{


 const  _SavedParameter(
    
  );
    @override
  List<Object> get props => [];
}
