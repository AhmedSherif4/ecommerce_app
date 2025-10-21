import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';

import '../../../../../core/shared_models/auth_entity/auth_entity.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../data/model/app_version_model.dart';

abstract class GlobalBaseRepository {
  Future<Either<Failure, AuthEntity>> getGuestData();

  Future<Either<Failure, AppVersionModel>> checkAppVersion();
  Future<Either<Failure, InfoModel>> info();

  Future<Either<Failure, UserEntity>> editUserData();
}
