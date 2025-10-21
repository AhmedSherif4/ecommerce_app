part of '../../verification.dart';

abstract class VerificationRemoteDataSource {
  Future<bool> checkVerificationCode({
    required String code,
    required String email,
  });

  Future<String> resendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  });

  Future<UserEntity> signUp({required SignUpParameter signUpParameter});
}

@LazySingleton(as: VerificationRemoteDataSource)
class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final SupabaseClient client;

  VerificationRemoteDataSourceImpl({
    required this.apiConsumer,
    required this.networkInfo,
    required this.baseDataSource,
    required this.client,
  });

  @override
  Future<bool> checkVerificationCode({
    required String code,
    required String email,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    } else {
      final response = await apiConsumer.post(
        EndPoints.verifyCode,
        body: {"input_code": code, "target_email": email},
        options: Options(),
      );
      return jsonDecode(response.data)['status'];
    }
  }

  @override
  Future<String> resendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.sendVerificationCode,
      body: {"target_email": sendVerificationCodeParameter.email},
      options: Options(),
    );
    return response['message'];
  }

  @override
  Future<UserEntity> signUp({required SignUpParameter signUpParameter}) async {
    try {
      await getIt<BaseAppSecurityData>().deleteToken();

      final signupResult = await client.auth.signUp(
        password: signUpParameter.password,
        email: signUpParameter.email,
      );

      'signed up'.log();

      await getIt<BaseAppSecurityData>().saveToken(
        token: signupResult.session!.accessToken,
      );
      'saved token'.log();
      print(client.auth.currentSession?.user?.id);
      print(client.auth.currentSession?.accessToken);

      getIt<BaseAppSecurityData>().getToken().log();

      final imageURL = await _imageConvert(signUpParameter.img);

      'converted image'.log();

      final Map<String, dynamic> response = await baseDataSource.postData(
        url: EndPoints.updateUserProfile,
        body: {
          "name": signUpParameter.name,
          "phone": signUpParameter.phone,
          "image_url": imageURL,
          "address": signUpParameter.address,
          "notification_id": await getIt<INotificationService>()
              .getDeviceToken(),
          "islocked": false,
          "gender": signUpParameter.gender,
        },
      );

      'response is: $response'.log();

      return UserModel.fromMap(response);
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  Future<String> _imageConvert(String imagePath) async {
    final file = File(imagePath); // المسار المحلي
    final fileName = 'user_${DateTime.now().millisecondsSinceEpoch}.jpg';

    await client.storage.from('avatars').upload(fileName, file);

    // خُد الرابط العام
    return client.storage.from('avatars').getPublicUrl(imagePath);
  }
}
