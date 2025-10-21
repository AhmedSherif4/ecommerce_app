import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';

abstract class CheckUserTokenBaseRepository {
  Future<Either<Failure, UserEntity>> checkUserToken();
}
