import '../../domain/entity/contact_us_entity.dart';

class ContactUsModel extends ContactUsEntity {
  const ContactUsModel({
    required super.email,
    required super.facebook,
    required super.instagram,
    required super.linkedIn,
    required super.youtube,
    required super.telegram,
    required super.whatsapp,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      email: json['email'] ?? '',
      facebook: json['facebook'] ?? '',
      instagram: json['instagram'] ?? '',
      linkedIn: json['linkedIn'] ?? '',
      youtube: json['youtube'] ?? '',
      telegram: json['telegram'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
    );
  }
}
