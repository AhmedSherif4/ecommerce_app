import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final bool hasOffer;
  final double priceAfterOffer;
  final int stock;
  final String categoryId;
  final String createdAt;
  final int favoritesCount;
  final int reviewsCount;
  final double averageRate;
  final bool isFavorite;
  final List<ReviewEntity> reviews;
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

class ReviewEntity extends Equatable {
  final String id;
  final int rate;
  final String comment;
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
