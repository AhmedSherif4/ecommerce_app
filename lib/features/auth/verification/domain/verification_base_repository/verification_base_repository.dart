part of '../../verification.dart';

abstract class VerificationBaseRepository {
  Future<Either<Failure, bool>> checkVerificationCode({
    required String code,
    required String email,
  });

  Future<Either<Failure, String>> resendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required SignUpParameter signUpParameter,
  });
}
