part of '../../payment.dart';

class CreateOrderEntity extends Equatable {
  final String orderId;
  final double totalAmount;
  final int itemsCount;

  const CreateOrderEntity({
    required this.orderId,
    required this.totalAmount,
    required this.itemsCount,
  });

  @override
  List<Object?> get props => [orderId, totalAmount, itemsCount];
}
