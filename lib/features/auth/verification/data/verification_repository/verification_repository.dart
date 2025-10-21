part of '../../verification.dart';

@LazySingleton(as: VerificationBaseRepository)
class VerificationRepository implements VerificationBaseRepository {
  final VerificationRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;

  const VerificationRepository({
    required this.userLocalDataSource,
    required this.remoteDataSource,
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, bool>> checkVerificationCode({
    required String code,
    required String email,
  }) async {
    final data = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.checkVerificationCode(code: code, email: email),
    );
    return data.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, String>> resendVerificationCode({
    required SendVerificationCodeParameter sendVerificationCodeParameter,
  }) async {
    final data = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.resendVerificationCode(
        sendVerificationCodeParameter: sendVerificationCodeParameter,
      ),
    );
    return data.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required SignUpParameter signUpParameter,
  }) async {
    final data = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.signUp(signUpParameter: signUpParameter),
    );
    return data.fold((l) => Left(l), (data) async {
      await userLocalDataSource.saveUserData(userModel: data);
      return Right(data);
    });
  }
}
