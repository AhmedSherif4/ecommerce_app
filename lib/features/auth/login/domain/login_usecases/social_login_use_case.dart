import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../login.dart';

@LazySingleton()
class SocialLoginUseCase extends BaseUseCase<UserEntity, String> {
  final LoginBaseRepository repository;

  SocialLoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(String socialId) async {
    return await repository.socialLogin(socialId);
  }
}
