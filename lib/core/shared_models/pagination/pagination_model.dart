import 'pagination_entity.dart';

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required super.currentPage,
    required super.from,
    required super.lastPage,
    required super.perPage,
    required super.to,
    required super.total,
    super.firstPageUrl,
    super.lastPageUrl,
    super.nextPageUrl,
    super.prevPageUrl,
    super.path,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'] as int,
      from: json['from'] as int,
      lastPage: json['lastPage'] as int,
      perPage: json['perPage'] as int,
      to: json['to'] as int,
      total: json['total'] as int,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      nextPageUrl: json['nextPageUrl'] as String?,
      prevPageUrl: json['prevPageUrl'] as String?,
      path: json['path'] as String?,
    );
  }
}
