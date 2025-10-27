part of '../../help_center.dart';

abstract class HelpCenterRemoteDataSource{

}

@LazySingleton(as: HelpCenterRemoteDataSource)
class HelpCenterRemoteDataSourceImpl implements HelpCenterRemoteDataSource{
    final BaseRemoteDataSource baseRemoteDataSource;

  HelpCenterRemoteDataSourceImpl({required this.baseRemoteDataSource});

}

class _HelpCenterParameter extends Equatable{


 const  _HelpCenterParameter(
    
  );
    @override
  List<Object> get props => [];
}
