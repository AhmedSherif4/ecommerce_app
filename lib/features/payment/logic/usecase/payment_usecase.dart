part of '../../payment.dart';

// Create Order UseCase
@LazySingleton()
class CreateOrderUseCase
    extends BaseUseCase<CreateOrderEntity, CreateOrderRequest> {
  final PaymentBaseRepository repository;

  CreateOrderUseCase({required this.repository});

  @override
  Future<Either<Failure, CreateOrderEntity>> call(
    CreateOrderRequest parameter,
  ) async {
    return await repository.createOrder(createOrderRequest: parameter);
  }
}

// Create Payment UseCase
@LazySingleton()
class CreatePaymentUseCase
    extends BaseUseCase<PaymentEntity, CreatePaymentRequest> {
  final PaymentBaseRepository repository;

  CreatePaymentUseCase({required this.repository});

  @override
  Future<Either<Failure, PaymentEntity>> call(
    CreatePaymentRequest parameter,
  ) async {
    return await repository.createPayment(createPaymentRequest: parameter);
  }
}

// Initiate Payment UseCase
@LazySingleton()
class InitiatePaymentUseCase
    extends BaseUseCase<InitiatePaymentEntity, InitiatePaymentRequest> {
  final PaymentBaseRepository repository;

  InitiatePaymentUseCase({required this.repository});

  @override
  Future<Either<Failure, InitiatePaymentEntity>> call(
    InitiatePaymentRequest parameter,
  ) async {
    return await repository.initiatePayment(initiatePaymentRequest: parameter);
  }
}

// Get User Orders UseCase
@LazySingleton()
class GetUserOrdersUseCase
    extends BaseUseCase<List<OrderEntity>, GetUserOrdersRequest> {
  final PaymentBaseRepository repository;

  GetUserOrdersUseCase({required this.repository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call(
    GetUserOrdersRequest parameter,
  ) async {
    return await repository.getUserOrders(getUserOrdersRequest: parameter);
  }
}
