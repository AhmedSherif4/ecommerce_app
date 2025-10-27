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
  final String sortBy;
  final int page;
  final int limitPerPage;

  const FilterProductsRequest({
    required this.minPrice,
    required this.maxPrice,
    this.sortBy = 'relevance',
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'min_price': minPrice,
      'max_price': maxPrice,
      'sort_by': sortBy,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}
