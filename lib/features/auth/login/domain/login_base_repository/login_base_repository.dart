part of '../../login.dart';

abstract class LoginBaseRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> socialLogin(String socialId);
}
