import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_repository/base_repository.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../domain/splash_base_repository/splash_base_repository.dart';
import '../splash_data_source/splash_remote_data_source.dart';

@LazySingleton(as: CheckUserTokenBaseRepository)
class CheckUserTokenRepository implements CheckUserTokenBaseRepository {
  final CheckUserTokenBaseRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;

  CheckUserTokenRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> checkUserToken() async {
    final json = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.checkUserToken(),
    );

    return json.fold((failure) => left(failure), (data) {
      getIt<UserLocalDataSource>().saveUserData(userModel: data);
      return right(data);
    });
  }
}
