import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'contact_us_entity.g.dart';

@HiveType(typeId: 3)
class ContactUsEntity extends Equatable {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String facebook;
  @HiveField(2)
  final String? instagram;
  @HiveField(3)
  final String? youtube;
  @HiveField(4)
  final String? linkedIn;
  @HiveField(5)
  final String whatsapp;
  @HiveField(6)
  final String? telegram;

  const ContactUsEntity({
    required this.email,
    required this.facebook,
    required this.instagram,
    required this.linkedIn,
    required this.youtube,
    required this.telegram,
    required this.whatsapp,
  });

  @override
  List<Object?> get props => [
    email,
    facebook,
    instagram,
    linkedIn,
    youtube,
    telegram,
    whatsapp,
  ];
}
