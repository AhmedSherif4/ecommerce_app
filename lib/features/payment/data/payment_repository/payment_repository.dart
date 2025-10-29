part of '../../payment.dart';

abstract class PaymentBaseRepository {
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required CreateOrderRequest createOrderRequest,
  });

  Future<Either<Failure, PaymentEntity>> createPayment({
    required CreatePaymentRequest createPaymentRequest,
  });

  Future<Either<Failure, InitiatePaymentEntity>> initiatePayment({
    required InitiatePaymentRequest initiatePaymentRequest,
  });

  Future<Either<Failure, List<OrderEntity>>> getUserOrders({
    required GetUserOrdersRequest getUserOrdersRequest,
  });

  Future<void> saveProductAtCart(CartItemRequest product);
  Future<void> removeProductFromCart(CartItemRequest product);
  Future<List<CartItemRequest>> getProductsCart();
  Future<void> clearProductsCart();
  Future<bool> isProductInCart(String productId);
  Future<List<CartItemRequest>> updateProductAtCart(
    CartItemRequest product,
    int index,
  );
}

@LazySingleton(as: PaymentBaseRepository)
class PaymentRepository implements PaymentBaseRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final PaymentLocalDataSource paymentLocalDataSource;
  final BaseRepository baseRepository;

  PaymentRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    required this.paymentLocalDataSource,
  });

  @override
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required CreateOrderRequest createOrderRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.createOrder(
      createOrderRequest: createOrderRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      final entity = CreateOrderEntity(
        orderId: response.data.orderId,
        totalAmount: response.data.totalAmount,
        itemsCount: response.data.itemsCount,
      );
      return Right(entity);
    });
  }

  @override
  Future<Either<Failure, PaymentEntity>> createPayment({
    required CreatePaymentRequest createPaymentRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.createPayment(
      createPaymentRequest: createPaymentRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (paymentModel) {
      return Right(paymentModel);
    });
  }

  @override
  Future<Either<Failure, InitiatePaymentEntity>> initiatePayment({
    required InitiatePaymentRequest initiatePaymentRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.initiatePayment(
      initiatePaymentRequest: initiatePaymentRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      final entity = InitiatePaymentEntity(
        orderId: response.data.orderId,
        transactionId: response.data.transactionId,
        status: response.data.status,
      );
      return Right(entity);
    });
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getUserOrders({
    required GetUserOrdersRequest getUserOrdersRequest,
  }) async {
    final jsonFromRemoteData = remoteDataSource.getUserOrders(
      getUserOrdersRequest: getUserOrdersRequest,
    );
    final data = await baseRepository.checkExceptionForRemoteData(
      jsonFromRemoteData,
    );
    return data.fold((failure) => Left(failure), (response) {
      return Right(response.data);
    });
  }

  @override
  Future<void> saveProductAtCart(CartItemRequest product) async {
    await paymentLocalDataSource.saveProductAtCart(product);
  }

  @override
  Future<void> removeProductFromCart(CartItemRequest product) async {
    await paymentLocalDataSource.removeProductFromCart(product);
  }

  @override
  Future<List<CartItemRequest>> getProductsCart() async {
    return await paymentLocalDataSource.getProductsCart();
  }

  @override
  Future<void> clearProductsCart() async {
    await paymentLocalDataSource.clearProductsCart();
  }

  @override
  Future<bool> isProductInCart(String productId) async {
    return await paymentLocalDataSource.isProductInCart(productId);
  }

  @override
  Future<List<CartItemRequest>> updateProductAtCart(
    CartItemRequest product,
    int index,
  ) async {
    return await paymentLocalDataSource.updateProductAtCart(product, index);
  }
}
