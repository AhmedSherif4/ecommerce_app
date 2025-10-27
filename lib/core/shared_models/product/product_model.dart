import '../../enum/enum_generation.dart';
import '../pagination/pagination_model.dart';
import 'product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.hasOffer,
    required super.priceAfterOffer,
    required super.stock,
    required super.categoryId,
    required super.createdAt,
    required super.favoritesCount,
    required super.reviewsCount,
    required super.averageRate,
    required super.isFavorite,
    required super.reviews,
    super.userReview,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
      hasOffer: json['has_offer'] as bool,
      priceAfterOffer: (json['price_after_offer'] as num).toDouble(),
      stock: json['stock'] as int,
      categoryId: json['category_id'] as String,
      createdAt: json['created_at'] as String,
      favoritesCount: json['favorites_count'] as int? ?? 0,
      reviewsCount: json['reviews_count'] as int? ?? 0,
      averageRate: (json['average_rate'] as num?)?.toDouble() ?? 0.0,
      isFavorite: json['is_favorite'] as bool? ?? false,
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map(
                (review) =>
                    ReviewModel.fromJson(review as Map<String, dynamic>),
              )
              .toList() ??
          [],
      userReview: json['user_review'] != null
          ? ReviewModel.fromJson(json['user_review'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'has_offer': hasOffer,
      'price_after_offer': priceAfterOffer,
      'stock': stock,
      'category_id': categoryId,
      'created_at': createdAt,
      'favorites_count': favoritesCount,
      'reviews_count': reviewsCount,
      'average_rate': averageRate,
      'is_favorite': isFavorite,
      'reviews': reviews.map((r) => (r as ReviewModel).toJson()).toList(),
      if (userReview != null)
        'user_review': (userReview as ReviewModel).toJson(),
    };
  }
}

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.rate,
    required super.comment,
    required super.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      rate: json['rate'] as int,
      comment: json['comment'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rate': rate,
      'comment': comment,
      'created_at': createdAt,
    };
  }
}

// Get All Products Request
class GetAllProductsRequest {
  final int page;
  final int limitPerPage;

  const GetAllProductsRequest({this.page = 1, this.limitPerPage = 20});

  Map<String, dynamic> toJson() {
    return {'page': page, 'limit_per_page': limitPerPage};
  }
}

// Get All Products Response
class GetAllProductsResponseModel {
  final bool status;
  final String message;
  final List<ProductModel> data;
  final PaginationModel pagination;

  const GetAllProductsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory GetAllProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllProductsResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}

// Get Products By Category Request
class GetProductsByCategoryRequest {
  final String categoryId;
  final int page;
  final int limitPerPage;

  const GetProductsByCategoryRequest({
    required this.categoryId,
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}

// Filter Products Request
class FilterProductsRequest {
  final double minPrice;
  final double maxPrice;
  final FilterSortTypes sortBy;
  final int page;
  final int limitPerPage;

  const FilterProductsRequest({
    this.minPrice = 10,
    this.maxPrice = 10000,
    this.sortBy = FilterSortTypes.relevance,
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'min_price': minPrice,
      'max_price': maxPrice,
      'sort_by': sortBy.name,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}
