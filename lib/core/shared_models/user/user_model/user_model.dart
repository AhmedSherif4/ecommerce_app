import '../user_entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.gender,
    required super.imgPath,
    required super.id,
    super.isLocked,
    required super.address,
    required super.notificationId,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json['data']['name'] != null ? json['data']['name'] as String : '',
      email: json['data']['email'] != null
          ? json['data']['email'] as String
          : '',
      phone: json['data']['phone'] != null
          ? json['data']['phone'] as String
          : '',
      gender: json['data']['gender'] ?? '',
      imgPath: json['data']['image_url'] != null
          ? json['data']['image_url'] as String
          : '',
      id: json['data']['id'] as String,
      isLocked: json['data']['isLocked'] ?? false,

      address: json['data']['address'] != null
          ? json['data']['address'] as String
          : '',
      notificationId: json['data']['notification_id'] != null
          ? json['data']['notification_id'] as String
          : '',
    );
  }
}
