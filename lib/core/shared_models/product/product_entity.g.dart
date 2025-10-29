// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 4;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      imageUrl: fields[3] as String,
      price: fields[4] as double,
      hasOffer: fields[5] as bool,
      priceAfterOffer: fields[6] as double,
      stock: fields[7] as int,
      categoryId: fields[8] as String,
      createdAt: fields[9] as String,
      favoritesCount: fields[10] as int,
      reviewsCount: fields[11] as int,
      averageRate: fields[12] as double,
      isFavorite: fields[13] as bool,
      reviews: (fields[14] as List).cast<ReviewEntity>(),
      userReview: fields[15] as ReviewEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.hasOffer)
      ..writeByte(6)
      ..write(obj.priceAfterOffer)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.favoritesCount)
      ..writeByte(11)
      ..write(obj.reviewsCount)
      ..writeByte(12)
      ..write(obj.averageRate)
      ..writeByte(13)
      ..write(obj.isFavorite)
      ..writeByte(14)
      ..write(obj.reviews)
      ..writeByte(15)
      ..write(obj.userReview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewEntityAdapter extends TypeAdapter<ReviewEntity> {
  @override
  final int typeId = 5;

  @override
  ReviewEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewEntity(
      id: fields[0] as String,
      rate: fields[1] as int,
      comment: fields[2] as String,
      createdAt: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rate)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
