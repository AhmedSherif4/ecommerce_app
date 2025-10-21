part of '../../forget_password.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<String> forgetPassword({
    required String email,
    required UsersType userType,
    required SendType sendType,
  });
}

@LazySingleton(
  as: ForgetPasswordRemoteDataSource,
)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;

  ForgetPasswordRemoteDataSourceImpl({required this.baseDataSource});

  @override
  Future<String> forgetPassword({
    required String email,
    required UsersType userType,
    required SendType sendType,
  }) async {
    print("usertype=$userType");
    final response = await baseDataSource.postData(
      url: EndPoints.forgotPasswordPath,
      body:{
        'email_or_phone': email,
        'type': userType.name == 'child' ? 'child' : 'parent',
        'send_type': sendType.name,
        'country_code':  AppReference.countryCode=='+966'?'+966':'+2',
      },
    );
    return response['message'];
  }
}
