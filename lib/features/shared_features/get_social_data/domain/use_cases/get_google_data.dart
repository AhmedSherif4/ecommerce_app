import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/failure/failure.dart';
import '../get_social_base_repository/get_social_base_repository.dart';

@LazySingleton()
class GetGoogleDataUseCase {
  final GetSocialDataBaseRepository getSocialDataBaseRepository;

  GetGoogleDataUseCase({required this.getSocialDataBaseRepository});

  Future<Either<Failure, GetGoogleDataParameter>> call() async {
    return await getSocialDataBaseRepository.getGoogleData();
  }
}

class GetGoogleDataParameter {
  final bool isCompletedProfile;
  final UserEntity user;

  GetGoogleDataParameter({
    required this.isCompletedProfile,
    required this.user,
  });
}
