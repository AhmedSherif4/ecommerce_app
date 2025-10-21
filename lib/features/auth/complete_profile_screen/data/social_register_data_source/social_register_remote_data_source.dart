import 'dart:io';

import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/core/shared_models/user/user_model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/social_register_usecases/social_register_usecase.dart';

abstract class SocialRegisterBaseRemoteDataSource {
  Future<UserEntity> socialRegister({
    required SocialRegisterData signUpParameter,
  });
}

@LazySingleton(as: SocialRegisterBaseRemoteDataSource)
class SocialRegisterRemoteDataSourceImpl
    implements SocialRegisterBaseRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;
  final SupabaseClient client;

  SocialRegisterRemoteDataSourceImpl({
    required this.baseDataSource,
    required this.client,
  });

  @override
  Future<UserEntity> socialRegister({
    required SocialRegisterData signUpParameter,
  }) async {
    String? imageURL;
    if (signUpParameter.photoUrl != null) {
      imageURL = await _imageConvert(signUpParameter.photoUrl!);
    }

    signUpParameter.gender.log();
    signUpParameter.photoUrl.log();
    signUpParameter.phone.log();
    signUpParameter.address.log();

    final body = {
      "phone": signUpParameter.phone,
      "image_url": imageURL,
      "address": signUpParameter.address,
      "gender": signUpParameter.gender,
    }..removeWhere((key, value) => value == null);

    body.log();

    final response = await baseDataSource.postData(
      url: EndPoints.updateUserProfile,
      body: body,
    );
    return UserModel.fromMap(response);
  }

  Future<String> _imageConvert(String imagePath) async {
    final file = File(imagePath); // المسار المحلي
    final fileName = 'user_${DateTime.now().millisecondsSinceEpoch}.jpg';

    await client.storage.from('avatars').upload(fileName, file);

    // خُد الرابط العام
    return client.storage.from('avatars').getPublicUrl(imagePath);
  }
}
