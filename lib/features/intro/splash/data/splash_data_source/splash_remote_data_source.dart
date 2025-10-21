import 'dart:convert';

import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../core/shared_models/user/user_model/user_model.dart';

abstract class CheckUserTokenBaseRemoteDataSource {
  Future<UserEntity> checkUserToken();
}

@LazySingleton(as: CheckUserTokenBaseRemoteDataSource)
class CheckUserTokenRemoteDataSourceImpl
    implements CheckUserTokenBaseRemoteDataSource {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final BaseRemoteDataSource baseRemoteDataSource;

  const CheckUserTokenRemoteDataSourceImpl({
    required this.networkInfo,
    required this.apiConsumer,
    required this.baseRemoteDataSource,
  });

  @override
  Future<UserEntity> checkUserToken() async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    } else {
      final response = await apiConsumer.post(EndPoints.checkTokenPath);
      if (response == null) {
        throw const ServerException(message: AppStrings.pleaseLogin);
      } else {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.data);
          if (json['data'] == null) {
            throw const ServerException(message: AppStrings.pleaseLogin);
          } else {
            return UserModel.fromMap(json);
          }
        } else {
          throw const ServerException(message: AppStrings.pleaseLogin);
        }
      }
    }
  }
}
