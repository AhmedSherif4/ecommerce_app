part of '../../details_product.dart';

abstract class DetailsProductRemoteDataSource{

}

@LazySingleton(as: DetailsProductRemoteDataSource)
class DetailsProductRemoteDataSourceImpl implements DetailsProductRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  DetailsProductRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _DetailsProductParameter extends Equatable{


 const  _DetailsProductParameter(
    
  );
    @override
  List<Object> get props => [];
}
