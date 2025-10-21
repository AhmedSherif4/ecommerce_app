import '../../domain/entity/pagination_entity.dart';

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required super.currentPage,
    super.from,
    required super.lastPage,
    required super.perPage,
    super.to,
    required super.total,
    required super.firstPageUrl,
    required super.lastPageUrl,
    super.nextPageUrl,
    required super.path,
    super.prevPageUrl,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'] ?? '',
      path: json['path'],
      prevPageUrl: json['prev_page_url'] ?? '',
    );
  }
}
