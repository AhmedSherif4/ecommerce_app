import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../splash_base_repository/splash_base_repository.dart';

@LazySingleton()
class CheckUserTokenUseCase extends BaseUseCase<UserEntity, NoParameter> {
  final CheckUserTokenBaseRepository repository;

  CheckUserTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParameter parameter) async {
    return await repository.checkUserToken();
  }
}
