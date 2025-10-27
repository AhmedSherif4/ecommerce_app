import 'package:equatable/equatable.dart';

class PaginationEntity extends Equatable {
  final int currentPage;
  final int from;
  final int lastPage;
  final int perPage;
  final int to;
  final int total;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String? path;

  const PaginationEntity({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.path,
  });

  @override
  List<Object?> get props => [
    currentPage,
    from,
    lastPage,
    perPage,
    to,
    total,
    firstPageUrl,
    lastPageUrl,
    nextPageUrl,
    prevPageUrl,
    path,
  ];
}
