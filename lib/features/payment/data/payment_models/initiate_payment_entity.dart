part of '../../payment.dart';

class InitiatePaymentEntity extends Equatable {
  final String orderId;
  final String transactionId;
  final String status;

  const InitiatePaymentEntity({
    required this.orderId,
    required this.transactionId,
    required this.status,
  });

  @override
  List<Object?> get props => [orderId, transactionId, status];
}
