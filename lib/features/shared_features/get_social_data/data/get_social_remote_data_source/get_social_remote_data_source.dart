import 'dart:async';

import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/core/shared_models/user/user_model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../core/exceptions/exceptions.dart';
import '../../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../../config/storages/secure_storage.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../my_app/notification/i_notification_service.dart';
import '../../domain/entity/social_login_data_entity.dart';

abstract class GetSocialDataBaseRemoteDataSource {
  Future<UserEntity> getGoogleData();
  Future<SocialLoginDataEntity> getAppleData();
}

@LazySingleton(as: GetSocialDataBaseRemoteDataSource)
class GetSocialDataRemoteDataSourceImpl
    extends GetSocialDataBaseRemoteDataSource {
  final SupabaseClient client;
  final BaseRemoteDataSource baseDataSource;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '439163769651-md52uetd554inb3jn9bkoq4fl7flbr8m.apps.googleusercontent.com',
  );

  GetSocialDataRemoteDataSourceImpl(this.baseDataSource, this.client);
  @override
  Future<SocialLoginDataEntity> getAppleData() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      return SocialLoginDataEntity(
        email: credential.email ?? '',
        displayName:
            (credential.familyName != null || credential.givenName != null)
            ? '${credential.givenName} ${credential.familyName}'
            : 'name not set',
        photoUrl: '',
        socialId: credential.userIdentifier ?? credential.authorizationCode,
      );
    } catch (error) {
      throw ServerException(message: 'Failed to sign in : $error');
    }
  }

  @override
  Future<UserEntity> getGoogleData() async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      final googleSignInValue = await _googleSignIn.signIn();

      final googleAuth = await googleSignInValue!.authentication;

      googleAuth.log();
      final accessToken = googleAuth.accessToken;
      accessToken.log();

      final idToken = googleAuth.idToken;
      idToken.log();

      if (accessToken == null || idToken == null) {
        throw const ServerException(message: 'Missing Google Auth Token');
      }
      AuthResponse loginResult = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      loginResult.log();

      await getIt<BaseAppSecurityData>().saveToken(
        token: loginResult.session!.accessToken,
      );

      final googleUser = _googleSignIn.currentUser;
      final Map<String, dynamic> response = await baseDataSource.postData(
        url: EndPoints.getUserData,
        body: {
          'v_notification_id': await getIt<INotificationService>()
              .getDeviceToken(),
        },
      );
      UserEntity user = UserModel.fromMap(response);
      'after the process of social login'.log();
      user.log();
      return user;
    } catch (error) {
      throw ServerException(message: 'Failed to sign in : $error');
    }
  }
}
