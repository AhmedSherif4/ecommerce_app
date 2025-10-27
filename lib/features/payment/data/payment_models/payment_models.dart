part of '../../payment.dart';

// Create Payment Request
class CreatePaymentRequest {
  final String orderId;
  final double amount;
  final String paymentGateway;
  final String currency;

  const CreatePaymentRequest({
    required this.orderId,
    required this.amount,
    required this.paymentGateway,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'amount': amount,
      'payment_gateway': paymentGateway,
      'currency': currency,
    };
  }
}

// Create Payment Response
class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.transactionId,
    super.paymentUrl,
    required super.clientSecret,
    required super.status,
    required super.amount,
    required super.currency,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      transactionId: json['data']['transaction_id'] as String,
      paymentUrl: json['data']['payment_url'] as String?,
      clientSecret: json['data']['client_secret'] as String,
      status: json['data']['status'] as String,
      amount: (json['data']['amount'] as num).toDouble(),
      currency: json['data']['currency'] as String,
    );
  }
}

// Initiate Payment Request
class InitiatePaymentRequest {
  final String pOrderId;
  final String pPaymentGateway;
  final String pTransactionId;
  final double pAmount;
  final String pPaymentMethod;
  final String pStatus;

  const InitiatePaymentRequest({
    required this.pOrderId,
    required this.pPaymentGateway,
    required this.pTransactionId,
    required this.pAmount,
    required this.pPaymentMethod,
    required this.pStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_order_id': pOrderId,
      'p_payment_gateway': pPaymentGateway,
      'p_transaction_id': pTransactionId,
      'p_amount': pAmount,
      'p_payment_method': pPaymentMethod,
      'p_status': pStatus,
    };
  }
}

// Initiate Payment Response
class InitiatePaymentResponseModel {
  final bool status;
  final String message;
  final InitiatePaymentDataModel data;

  const InitiatePaymentResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory InitiatePaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return InitiatePaymentResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: InitiatePaymentDataModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }
}

class InitiatePaymentDataModel {
  final String orderId;
  final String transactionId;
  final String status;

  const InitiatePaymentDataModel({
    required this.orderId,
    required this.transactionId,
    required this.status,
  });

  factory InitiatePaymentDataModel.fromJson(Map<String, dynamic> json) {
    return InitiatePaymentDataModel(
      orderId: json['order_id'] as String,
      transactionId: json['transaction_id'] as String,
      status: json['status'] as String,
    );
  }
}
