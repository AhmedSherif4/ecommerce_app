part of '../.././sign_up.dart';

abstract class SignUpRemoteDataSource {
  Future<String> sendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  });
}

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;

  SignUpRemoteDataSourceImpl(this.baseDataSource);

  @override
  Future<String> sendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.sendVerificationCode,
      body: {"target_email": sendVerificationCodeParameter.email},
      options: Options(),
    );
    return response['message'];
  }
}
