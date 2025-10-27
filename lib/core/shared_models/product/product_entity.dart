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
  ];
}
