import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';

import '../../../../../../core/failure/failure.dart';
import '../social_register_usecases/social_register_usecase.dart';

abstract class SocialRegisterBaseRepository {
  Future<Either<Failure, UserEntity>> socialRegister({
    required SocialRegisterData signUpParameter,
  });
}
