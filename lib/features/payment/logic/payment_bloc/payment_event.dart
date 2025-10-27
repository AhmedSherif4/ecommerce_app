part of '../../payment.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends PaymentEvent {
  final CreateOrderRequest createOrderRequest;

  const CreateOrderEvent({required this.createOrderRequest});

  @override
  List<Object> get props => [createOrderRequest];
}

class CreatePaymentEvent extends PaymentEvent {
  final CreatePaymentRequest createPaymentRequest;

  const CreatePaymentEvent({required this.createPaymentRequest});

  @override
  List<Object> get props => [createPaymentRequest];
}

class InitiatePaymentEvent extends PaymentEvent {
  final InitiatePaymentRequest initiatePaymentRequest;

  const InitiatePaymentEvent({required this.initiatePaymentRequest});

  @override
  List<Object> get props => [initiatePaymentRequest];
}

class GetUserOrdersEvent extends PaymentEvent {
  final GetUserOrdersRequest getUserOrdersRequest;

  const GetUserOrdersEvent({required this.getUserOrdersRequest});

  @override
  List<Object> get props => [getUserOrdersRequest];
}
