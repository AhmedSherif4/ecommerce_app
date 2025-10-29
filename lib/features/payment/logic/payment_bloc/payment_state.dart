part of '../../payment.dart';

class PaymentState extends Equatable {
  // Create Order
  final RequestStates createOrderState;
  final CreateOrderEntity? createOrderEntity;
  final String createOrderMessage;

  // Create Payment
  final RequestStates createPaymentState;
  final PaymentEntity? paymentEntity;
  final String createPaymentMessage;

  // Initiate Payment
  final RequestStates initiatePaymentState;
  final InitiatePaymentEntity? initiatePaymentEntity;
  final String initiatePaymentMessage;

  // Get User Orders
  final RequestStates getUserOrdersState;
  final List<OrderEntity> userOrders;
  final String getUserOrdersMessage;
  // local cart
  final List<CartItemRequest> localProductsCart;
  final RequestStates localProductsCartState;
  final String localProductsCartMessage;
  final bool isProductInCart;

  const PaymentState({
    this.createOrderState = RequestStates.initial,
    this.createOrderEntity,
    this.createOrderMessage = '',
    this.createPaymentState = RequestStates.initial,
    this.paymentEntity,
    this.createPaymentMessage = '',
    this.initiatePaymentState = RequestStates.initial,
    this.initiatePaymentEntity,
    this.initiatePaymentMessage = '',
    this.getUserOrdersState = RequestStates.initial,
    this.userOrders = const [],
    this.getUserOrdersMessage = '',
    this.localProductsCartState = RequestStates.initial,
    this.localProductsCart = const [],
    this.localProductsCartMessage = '',
    this.isProductInCart = false,
  });

  PaymentState copyWith({
    RequestStates? createOrderState,
    CreateOrderEntity? createOrderEntity,
    String? createOrderMessage,
    RequestStates? createPaymentState,
    PaymentEntity? paymentEntity,
    String? createPaymentMessage,
    RequestStates? initiatePaymentState,
    InitiatePaymentEntity? initiatePaymentEntity,
    String? initiatePaymentMessage,
    RequestStates? getUserOrdersState,
    List<OrderEntity>? userOrders,
    String? getUserOrdersMessage,
    RequestStates? localProductsCartState,
    List<CartItemRequest>? localProductsCart,
    String? localProductsCartMessage,
    bool? isProductInCart,
  }) {
    return PaymentState(
      createOrderState: createOrderState ?? this.createOrderState,
      createOrderEntity: createOrderEntity ?? this.createOrderEntity,
      createOrderMessage: createOrderMessage ?? this.createOrderMessage,
      createPaymentState: createPaymentState ?? this.createPaymentState,
      paymentEntity: paymentEntity ?? this.paymentEntity,
      createPaymentMessage: createPaymentMessage ?? this.createPaymentMessage,
      initiatePaymentState: initiatePaymentState ?? this.initiatePaymentState,
      initiatePaymentEntity:
          initiatePaymentEntity ?? this.initiatePaymentEntity,
      initiatePaymentMessage:
          initiatePaymentMessage ?? this.initiatePaymentMessage,
      getUserOrdersState: getUserOrdersState ?? this.getUserOrdersState,
      userOrders: userOrders ?? this.userOrders,
      getUserOrdersMessage: getUserOrdersMessage ?? this.getUserOrdersMessage,
      localProductsCart: localProductsCart ?? this.localProductsCart,
      localProductsCartMessage:
          localProductsCartMessage ?? this.localProductsCartMessage,
      localProductsCartState:
          localProductsCartState ?? this.localProductsCartState,
      isProductInCart: isProductInCart ?? this.isProductInCart,
    );
  }

  @override
  List<Object?> get props => [
    createOrderState,
    createOrderEntity,
    createOrderMessage,
    createPaymentState,
    paymentEntity,
    createPaymentMessage,
    initiatePaymentState,
    initiatePaymentEntity,
    initiatePaymentMessage,
    getUserOrdersState,
    userOrders,
    getUserOrdersMessage,
    localProductsCartMessage,
    localProductsCart,
    localProductsCartState,
    isProductInCart,
  ];
}
