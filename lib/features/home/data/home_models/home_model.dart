part of '../../home.dart';

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
