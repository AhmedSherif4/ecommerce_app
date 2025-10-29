part of '../../payment.dart';

// Response Models
class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.totalAmount,
    required super.status,
    super.paymentMethod,
    super.paymentGateway,
    super.paymentGatewayOrderId,
    required super.shippingAddress,
    super.notes,
    required super.createdAt,
    required super.updatedAt,
    required super.items,
    super.paymentTransaction,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String?,
      paymentGateway: json['payment_gateway'] as String?,
      paymentGatewayOrderId: json['payment_gateway_order_id'] as String?,
      shippingAddress: ShippingAddressModel.fromJson(
        json['shipping_address'] as Map<String, dynamic>,
      ),
      notes: json['notes'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      paymentTransaction: json['payment_transaction'] != null
          ? PaymentTransactionModel.fromJson(
              json['payment_transaction'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.productId,
    required super.quantity,
    required super.priceAtPurchase,
    required super.total,
    required super.createdAt,
    required super.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      quantity: json['quantity'] as int,
      priceAtPurchase: (json['price_at_purchase'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      createdAt: json['created_at'] as String,
      product: ProductInOrderModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
    );
  }
}

class ProductInOrderModel extends ProductInOrderEntity {
  const ProductInOrderModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory ProductInOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductInOrderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}

class ShippingAddressModel extends ShippingAddressEntity {
  const ShippingAddressModel({
    required super.city,
    required super.country,
    super.street,
    super.postalCode,
    super.phone,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      city: json['city'] as String,
      country: json['country'] as String,
      street: json['street'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
      if (street != null) 'street': street,
      if (postalCode != null) 'postal_code': postalCode,
      if (phone != null) 'phone': phone,
    };
  }
}

class PaymentTransactionModel extends PaymentTransactionEntity {
  const PaymentTransactionModel({
    required super.id,
    required super.transactionId,
    required super.amount,
    required super.currency,
    required super.status,
    required super.paymentMethod,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) {
    return PaymentTransactionModel(
      id: json['id'] as String,
      transactionId: json['transaction_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required super.currentPage,
    required super.from,
    required super.lastPage,
    required super.perPage,
    required super.to,
    required super.total,
    super.firstPageUrl,
    super.lastPageUrl,
    super.nextPageUrl,
    super.prevPageUrl,
    super.path,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'] as int,
      from: json['from'] as int,
      lastPage: json['lastPage'] as int,
      perPage: json['perPage'] as int,
      to: json['to'] as int,
      total: json['total'] as int,
      firstPageUrl: json['firstPageUrl'] as String?,
      lastPageUrl: json['lastPageUrl'] as String?,
      nextPageUrl: json['nextPageUrl'] as String?,
      prevPageUrl: json['prevPageUrl'] as String?,
      path: json['path'] as String?,
    );
  }
}

// Request Models

class CreateOrderRequest {
  final List<CartItemRequest> cartItems;
  final ShippingAddressModel shippingAddress;
  final String? notes;

  const CreateOrderRequest({
    required this.cartItems,
    required this.shippingAddress,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'cart_items': cartItems.map((item) => item.toJson()).toList(),
      'shipping_address': shippingAddress.toJson(),
      if (notes != null) 'notes': notes,
    };
  }
}

class CreateOrderResponseModel {
  final bool status;
  final String message;
  final CreateOrderDataModel data;

  const CreateOrderResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: CreateOrderDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class CreateOrderDataModel {
  final String orderId;
  final double totalAmount;
  final int itemsCount;

  const CreateOrderDataModel({
    required this.orderId,
    required this.totalAmount,
    required this.itemsCount,
  });

  factory CreateOrderDataModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderDataModel(
      orderId: json['order_id'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      itemsCount: json['items_count'] as int,
    );
  }
}
