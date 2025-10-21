import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_models/auth_entity/auth_entity.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../../../../core/shared_models/user/user_model/user_model.dart';
// import '../../../../auth/shared_screens/login/data/models/login_model.dart';
import '../../../../auth/login/data/models/login_model.dart';
import '../model/app_version_model.dart';

abstract class GlobalBaseRemoteDataSource {
  Future<AuthEntity> getGuestData();

  Future<AppVersionModel> checkAppVersion();

  Future<InfoModel> info();

  Future<UserEntity> editUserData();
}

@LazySingleton(as: GlobalBaseRemoteDataSource)
class GlobalRemoteDataSourceImpl implements GlobalBaseRemoteDataSource {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final BaseRemoteDataSource baseRemoteDataSource;

  const GlobalRemoteDataSourceImpl({
    required this.networkInfo,
    required this.apiConsumer,
    required this.baseRemoteDataSource,
  });

  @override
  Future<AuthEntity> getGuestData() async {
    final response = await baseRemoteDataSource.postData(
      url: EndPoints.getGuestData,
      body: {},
    );

    return LoginModel.fromMap(response);
  }

  @override
  Future<AppVersionModel> checkAppVersion() async {
    final response = await baseRemoteDataSource.publicPostData(
      url: EndPoints.checkVersion,
      body: {},
    );
    return AppVersionModel.fromJson(response['data']);
  }

  @override
  Future<InfoModel> info() async {
    final response = await baseRemoteDataSource.publicPostData(
      url: EndPoints.contactUsPath,
      body: {},
    );

    return InfoModel.fromJson(response['data']);
  }

  @override
  Future<UserEntity> editUserData() async {
    final response = await baseRemoteDataSource.postDataBackParent(
      url: EndPoints.mePath,
      body: {},
    );
    return UserModel.fromMap(response['data']);
  }
}
