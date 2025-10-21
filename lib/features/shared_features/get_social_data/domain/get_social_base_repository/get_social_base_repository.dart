import 'package:dartz/dartz.dart';

import '../../../../../../core/failure/failure.dart';
import '../entity/social_login_data_entity.dart';
import '../use_cases/get_google_data.dart';

abstract class GetSocialDataBaseRepository {
  Future<Either<Failure, GetGoogleDataParameter>> getGoogleData();
  Future<Either<Failure, SocialLoginDataEntity>> getAppleData();
}
