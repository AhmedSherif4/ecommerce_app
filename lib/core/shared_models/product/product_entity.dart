import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 4)
class ProductEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool hasOffer;
  @HiveField(6)
  final double priceAfterOffer;
  @HiveField(7)
  final int stock;
  @HiveField(8)
  final String categoryId;
  @HiveField(9)
  final String createdAt;
  @HiveField(10)
  final int favoritesCount;
  @HiveField(11)
  final int reviewsCount;
  @HiveField(12)
  final double averageRate;
  @HiveField(13)
  final bool isFavorite;
  @HiveField(14)
  final List<ReviewEntity> reviews;
  @HiveField(15)
  final ReviewEntity? userReview;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.hasOffer,
    required this.priceAfterOffer,
    required this.stock,
    required this.categoryId,
    required this.createdAt,
    required this.favoritesCount,
    required this.reviewsCount,
    required this.averageRate,
    required this.isFavorite,
    required this.reviews,
    this.userReview,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    price,
    hasOffer,
    priceAfterOffer,
    stock,
    categoryId,
    createdAt,
    favoritesCount,
    reviewsCount,
    averageRate,
    isFavorite,
    reviews,
    userReview,
  ];
}

@HiveType(typeId: 5)
class ReviewEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int rate;
  @HiveField(2)
  final String comment;
  @HiveField(3)
  final String createdAt;

  const ReviewEntity({
    required this.id,
    required this.rate,
    required this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, rate, comment, createdAt];
}
