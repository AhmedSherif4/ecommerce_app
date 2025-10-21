// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactUsEntityAdapter extends TypeAdapter<ContactUsEntity> {
  @override
  final int typeId = 3;

  @override
  ContactUsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactUsEntity(
      email: fields[0] as String,
      facebook: fields[1] as String,
      instagram: fields[2] as String?,
      linkedIn: fields[4] as String?,
      youtube: fields[3] as String?,
      telegram: fields[6] as String?,
      whatsapp: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactUsEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.facebook)
      ..writeByte(2)
      ..write(obj.instagram)
      ..writeByte(3)
      ..write(obj.youtube)
      ..writeByte(4)
      ..write(obj.linkedIn)
      ..writeByte(5)
      ..write(obj.whatsapp)
      ..writeByte(6)
      ..write(obj.telegram);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactUsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
