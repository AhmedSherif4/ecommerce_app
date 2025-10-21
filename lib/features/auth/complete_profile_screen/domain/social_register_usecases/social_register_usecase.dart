import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../social_register_base_repository/social_register_base_repository.dart';

@LazySingleton()
class SocialRegisterCodeUseCase
    extends BaseUseCase<UserEntity, SocialRegisterData> {
  final SocialRegisterBaseRepository repository;

  SocialRegisterCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(SocialRegisterData parameter) {
    return repository.socialRegister(signUpParameter: parameter);
  }
}

class SocialRegisterData extends Equatable {
  final String? photoUrl;
  final String? gender;
  final String? phone;
  final String? address;

  const SocialRegisterData({
    required this.photoUrl,
    required this.gender,
    required this.phone,
    required this.address,
  });

  @override
  List<Object?> get props => [photoUrl, gender, phone, address];
}
