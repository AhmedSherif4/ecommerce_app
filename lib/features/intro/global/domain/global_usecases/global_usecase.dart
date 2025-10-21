import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_models/auth_entity/auth_entity.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../data/model/app_version_model.dart';
import '../global_base_repository/global_base_repository.dart';

@LazySingleton()
class GetGuestDataUseCase extends BaseUseCase<AuthEntity, NoParameter> {
  final GlobalBaseRepository repository;

  GetGuestDataUseCase(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(NoParameter parameter) async {
    return await repository.getGuestData();
  }
}

@LazySingleton()
class CheckAppVersionUseCase extends BaseUseCase<AppVersionModel, NoParameter> {
  final GlobalBaseRepository repository;

  CheckAppVersionUseCase({required this.repository});

  @override
  Future<Either<Failure, AppVersionModel>> call(NoParameter parameter) async {
    return await repository.checkAppVersion();
  }
}

@LazySingleton()
class GetInfoUseCase extends BaseUseCase<InfoModel, NoParameter> {
  final GlobalBaseRepository repository;

  GetInfoUseCase({required this.repository});

  @override
  Future<Either<Failure, InfoModel>> call(NoParameter parameter) async {
    return await repository.info();
  }
}

@LazySingleton()
class EditUserDataUseCase extends BaseUseCase<UserEntity, NoParameter> {
  final GlobalBaseRepository repository;

  EditUserDataUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParameter parameter) async {
    return await repository.editUserData();
  }
}
