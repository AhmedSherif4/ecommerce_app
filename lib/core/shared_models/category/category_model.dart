import 'category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'created_at': createdAt};
  }
}

// Get All Categories Response
class GetAllCategoriesResponseModel {
  final bool status;
  final String message;
  final List<CategoryModel> data;

  const GetAllCategoriesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoriesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map(
            (category) =>
                CategoryModel.fromJson(category as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
