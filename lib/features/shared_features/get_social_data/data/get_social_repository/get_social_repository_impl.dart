import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/resources/app_strings.dart';
import '../../../../../../core/api/network_info.dart';
import '../../../../../../core/failure/failure.dart';
import '../../../../../config/base_repository/base_repository.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../domain/entity/social_login_data_entity.dart';
import '../../domain/get_social_base_repository/get_social_base_repository.dart';
import '../../domain/use_cases/get_google_data.dart';
import '../get_social_remote_data_source/get_social_remote_data_source.dart';

@LazySingleton(as: GetSocialDataBaseRepository)
class GetSocialDataRepositoryImpl extends GetSocialDataBaseRepository {
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;
  final GetSocialDataBaseRemoteDataSource getSocialDataBaseRemoteDataSource;
  final NetworkInfo networkInfo;

  GetSocialDataRepositoryImpl({
    required this.getSocialDataBaseRemoteDataSource,
    required this.userLocalDataSource,
    required this.baseRepository,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SocialLoginDataEntity>> getAppleData() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await getSocialDataBaseRemoteDataSource.getAppleData());
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetGoogleDataParameter>> getGoogleData() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await getSocialDataBaseRemoteDataSource.getGoogleData();
        if (user.name.isNotEmpty &&
            (user.email?.isNotEmpty ?? false) &&
            (user.phone?.isNotEmpty ?? false) &&
            (user.gender?.isNotEmpty ?? false) &&
            (user.address?.isNotEmpty ?? false) &&
            (user.imgPath?.isNotEmpty ?? false)) {
          await getIt<UserLocalDataSource>().saveUserData(userModel: user);
          // bool to indicate that all user data is complete
          return Right(
            GetGoogleDataParameter(isCompletedProfile: true, user: user),
          );
        } else {
          // false to indicate that user data is not complete
          return Right(
            GetGoogleDataParameter(isCompletedProfile: false, user: user),
          );
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return left(const ServerFailure(AppStrings.noInternetConnection));
    }
  }
}
