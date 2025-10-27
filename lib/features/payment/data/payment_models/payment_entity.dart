part of '../../payment.dart';

class PaymentEntity extends Equatable {
  final String transactionId;
  final String? paymentUrl;
  final String clientSecret;
  final String status;
  final double amount;
  final String currency;

  const PaymentEntity({
    required this.transactionId,
    this.paymentUrl,
    required this.clientSecret,
    required this.status,
    required this.amount,
    required this.currency,
  });

  @override
  List<Object?> get props => [
    transactionId,
    paymentUrl,
    clientSecret,
    status,
    amount,
    currency,
  ];
}
