import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String? imgPath;
  @HiveField(5)
  final bool? isLocked;
  @HiveField(6)
  final String? notificationId;
  @HiveField(7)
  final String? gender;
  @HiveField(8)
  final String? address;

  const UserEntity({
    required this.isLocked,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.imgPath,
    required this.id,
    required this.address,
    required this.notificationId,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? imgPath,
    bool? isLocked,
    String? address,
    String? notificationId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      imgPath: imgPath ?? this.imgPath,
      isLocked: isLocked ?? this.isLocked,
      address: address ?? this.address,
      notificationId: notificationId ?? this.notificationId,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    gender,
    imgPath,
    isLocked,
    address,
    notificationId,
  ];
}
