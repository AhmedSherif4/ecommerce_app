part of '../../login.dart';

abstract class LoginRemoteDataSource {
  Future<UserEntity> login({required String email, required String password});

  Future<UserEntity> socialLogin(String socialId);
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final SupabaseClient client;
  final BaseRemoteDataSource baseDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  LoginRemoteDataSourceImpl({
    required this.baseDataSource,
    required this.userLocalDataSource,
    required this.client,
    required this.networkInfo,
  });

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      await getIt<BaseAppSecurityData>().deleteToken();

      if (!await networkInfo.isConnected) {
        throw const NoInternetConnectionException();
      }

      final loginResult = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      await getIt<BaseAppSecurityData>().saveToken(
        token: loginResult.session!.accessToken,
      );

      final Map<String, dynamic> response = await baseDataSource.postData(
        url: EndPoints.getUserData,
        body: {
          'v_notification_id': await getIt<INotificationService>()
              .getDeviceToken(),
        },
      );

      return UserModel.fromMap(response);
    } on AuthApiException catch (error) {
      throw ServerException(message: error.message);
    }
  }

  @override
  Future<UserEntity> socialLogin(String socialId) async {
    final response = await baseDataSource.postData(
      url: EndPoints.getUserData,
      body: {
        'v_notification_id': await getIt<INotificationService>()
            .getDeviceToken(),
      },
    );
    return UserModel.fromMap(response);
  }
}
