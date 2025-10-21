import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/base_repository/base_repository.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../domain/social_register_base_repository/social_register_base_repository.dart';
import '../../domain/social_register_usecases/social_register_usecase.dart';
import '../social_register_data_source/social_register_remote_data_source.dart';

@LazySingleton(as: SocialRegisterBaseRepository)
class SocialRegisterRepository implements SocialRegisterBaseRepository {
  final SocialRegisterBaseRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;

  SocialRegisterRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> socialRegister({
    required SocialRegisterData signUpParameter,
  }) async {
    final data = await baseRepository.checkExceptionForRemoteData(
      remoteDataSource.socialRegister(signUpParameter: signUpParameter),
    );
    return data.fold((l) => Left(l), (data) async {
      await userLocalDataSource.saveUserData(userModel: data);
      return Right(data);
    });
  }
}
