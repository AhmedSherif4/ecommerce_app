part of '../../address.dart';

class AddressModel {
  final String title;
  final String details;
  final bool isDefault;
  final bool isSelected;

  AddressModel({
    required this.title,
    required this.details,
    this.isDefault = false,
    this.isSelected = false,
  });

  AddressModel copyWith({
    String? title,
    String? details,
    bool? isDefault,
    bool? isSelected,
  }) {
    return AddressModel(
      title: title ?? this.title,
      details: details ?? this.details,
      isDefault: isDefault ?? this.isDefault,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
