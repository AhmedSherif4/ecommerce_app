part of '../../saved.dart';

class GetUserFavoritesRequest {
  final int page;
  final int limitPerPage;

  const GetUserFavoritesRequest({this.page = 1, this.limitPerPage = 20});

  Map<String, dynamic> toJson() {
    return {'page': page, 'limit_per_page': limitPerPage};
  }
}

class AddToFavoritesRequest {
  final String productId;
  final int page;
  final int limitPerPage;

  const AddToFavoritesRequest({
    required this.productId,
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_product_id': productId,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}

class RemoveFromFavoritesRequest {
  final String productId;
  final int page;
  final int limitPerPage;

  const RemoveFromFavoritesRequest({
    required this.productId,
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_product_id': productId,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}

class GetUserFavoritesResponseModel {
  final bool status;
  final String message;
  final List<ProductModel> data;
  final PaginationModel pagination;

  const GetUserFavoritesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory GetUserFavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetUserFavoritesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
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

class FavoriteStatsModel {
  final String productId;
  final int productFavoritesCount;

  const FavoriteStatsModel({
    required this.productId,
    required this.productFavoritesCount,
  });

  factory FavoriteStatsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteStatsModel(
      productId: json['product_id'] as String,
      productFavoritesCount: json['product_favorites_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_favorites_count': productFavoritesCount,
    };
  }
}

class AddToFavoritesResponseModel {
  final bool status;
  final String message;
  final List<ProductModel> data;
  final FavoriteStatsModel stats;
  final PaginationModel pagination;

  const AddToFavoritesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.stats,
    required this.pagination,
  });

  factory AddToFavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    return AddToFavoritesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList(),
      stats: FavoriteStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}

class RemoveFromFavoritesResponseModel {
  final bool status;
  final String message;
  final List<ProductModel> data;
  final PaginationModel pagination;

  const RemoveFromFavoritesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory RemoveFromFavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    return RemoveFromFavoritesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
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
