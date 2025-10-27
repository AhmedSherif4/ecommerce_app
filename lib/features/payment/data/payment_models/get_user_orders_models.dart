part of '../../payment.dart';

// Get User Orders Request
class GetUserOrdersRequest {
  final int page;
  final int limitPerPage;

  const GetUserOrdersRequest({required this.page, required this.limitPerPage});

  Map<String, dynamic> toJson() {
    return {'page': page, 'limit_per_page': limitPerPage};
  }
}

// Get User Orders Response
class GetUserOrdersResponseModel {
  final bool status;
  final String message;
  final List<OrderModel> data;
  final PaginationModel pagination;

  const GetUserOrdersResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory GetUserOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return GetUserOrdersResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((order) => OrderModel.fromJson(order as Map<String, dynamic>))
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}
