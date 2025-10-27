part of '../../payment.dart';

abstract class PaymentRemoteDataSource {
  Future<CreateOrderResponseModel> createOrder({
    required CreateOrderRequest createOrderRequest,
  });

  Future<PaymentModel> createPayment({
    required CreatePaymentRequest createPaymentRequest,
  });

  Future<InitiatePaymentResponseModel> initiatePayment({
    required InitiatePaymentRequest initiatePaymentRequest,
  });

  Future<GetUserOrdersResponseModel> getUserOrders({
    required GetUserOrdersRequest getUserOrdersRequest,
  });
}

@LazySingleton(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final BaseRemoteDataSource baseDataSource;
  final NetworkInfo networkInfo;

  PaymentRemoteDataSourceImpl(this.baseDataSource, this.networkInfo);

  @override
  Future<CreateOrderResponseModel> createOrder({
    required CreateOrderRequest createOrderRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.createOrder,
      body: createOrderRequest.toJson(),
    );
    return CreateOrderResponseModel.fromJson(response);
  }

  final ApiConsumer consumer = getIt<ApiConsumer>();
  @override
  Future<PaymentModel> createPayment({
    required CreatePaymentRequest createPaymentRequest,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    }
    final response = await baseDataSource.postData(
      url: EndPoints.createPayment,
      body: createPaymentRequest.toJson(),
    );

    '$response'.log();

    return PaymentModel.fromJson(response);
  }

  @override
  Future<InitiatePaymentResponseModel> initiatePayment({
    required InitiatePaymentRequest initiatePaymentRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.initiatePayment,
      body: initiatePaymentRequest.toJson(),
    );
    return InitiatePaymentResponseModel.fromJson(response);
  }

  @override
  Future<GetUserOrdersResponseModel> getUserOrders({
    required GetUserOrdersRequest getUserOrdersRequest,
  }) async {
    final response = await baseDataSource.postData(
      url: EndPoints.getUserOrders,
      body: getUserOrdersRequest.toJson(),
    );
    return GetUserOrdersResponseModel.fromJson(response);
  }

  Future<Map<String, dynamic>> _checkStatusCode(Response response) async {
    if (response.statusCode != 200) {
      throw ServerException(
        message:
            jsonDecode(response.data)['message'] ??
            AppStrings.someThingWentWrong,
      );
    }
    final json = jsonDecode(response.data);

    return json;
  }
}
