part of '../../login.dart';

@LazySingleton(as: LoginBaseRepository)
class LoginRepository implements LoginBaseRepository {
  final LoginRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;

  LoginRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final userModelFromRemoteData = remoteDataSource.login(
      email: email,
      password: password,
    );
    final data = await baseRepository.checkExceptionForRemoteData<UserEntity>(
      userModelFromRemoteData,
    );
    return data.fold((failure) => left(failure), (data) async {
      if (data.isLocked == true) {
        return Right(data);
      } else {
        await userLocalDataSource.saveUserData(userModel: data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, UserEntity>> socialLogin(String socialId) async {
    final data = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.socialLogin(socialId),
    );
    return data.fold((failure) => left(failure), (userData) async {
      if (userData.isLocked == true) {
        return Right(userData);
      } else {
        await userLocalDataSource.saveUserData(userModel: userData);
        return Right(userData);
      }
    });
  }
}
