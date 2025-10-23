part of '../../checkout.dart';

class PaymentMethodModel {
  final String cardNumber;
  final String expireDate;
  final String securityCode;
  final bool isDefault;
  final bool isSelected;

  PaymentMethodModel({
    required this.cardNumber,
    required this.expireDate,
    required this.securityCode,
    required this.isDefault,
    required this.isSelected,
  });

  // ✅ نسخة جديدة مع تعديل القيم
  PaymentMethodModel copyWith({
    String? cardNumber,
    String? expireDate,
    String? securityCode,
    bool? isDefault,
    bool? isSelected,
  }) {
    return PaymentMethodModel(
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      securityCode: securityCode ?? this.securityCode,
      isDefault: isDefault ?? this.isDefault,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
