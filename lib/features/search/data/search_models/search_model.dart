part of '../../search.dart';

class SearchProductsRequest {
  final String searchTerm;
  final int page;
  final int limitPerPage;

  const SearchProductsRequest({
    required this.searchTerm,
    this.page = 1,
    this.limitPerPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'search_term': searchTerm,
      'page': page,
      'limit_per_page': limitPerPage,
    };
  }
}

class SearchProductsResponseModel {
  final bool status;
  final String message;
  final List<ProductModel> data;
  final PaginationModel pagination;

  const SearchProductsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory SearchProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchProductsResponseModel(
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
