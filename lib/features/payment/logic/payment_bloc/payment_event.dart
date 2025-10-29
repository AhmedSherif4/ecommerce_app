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

class AddProductToCartEvent extends PaymentEvent {
  final CartItemRequest product;

  const AddProductToCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends PaymentEvent {
  final CartItemRequest product;

  const RemoveProductFromCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class IsProductInCartEvent extends PaymentEvent {
  final String productId;

  const IsProductInCartEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class LoadCartProductsEvent extends PaymentEvent {
  const LoadCartProductsEvent();
  @override
  List<Object> get props => [];
}

class UpdateCartQuantityEvent extends PaymentEvent {
  final CartItemRequest cartItemRequest;
  final int index;
  const UpdateCartQuantityEvent(this.cartItemRequest, this.index);
  @override
  List<Object> get props => [CartItemRequest, index];
}

class ClearCartEvent extends PaymentEvent {
  const ClearCartEvent();
  @override
  List<Object> get props => [];
}
