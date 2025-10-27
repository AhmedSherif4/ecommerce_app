part of '../../payment.dart';

class OrderEntity extends Equatable {
  final String id;
  final double totalAmount;
  final String status;
  final String? paymentMethod;
  final String? paymentGateway;
  final String? paymentGatewayOrderId;
  final ShippingAddressEntity shippingAddress;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final List<OrderItemEntity> items;
  final PaymentTransactionEntity? paymentTransaction;

  const OrderEntity({
    required this.id,
    required this.totalAmount,
    required this.status,
    this.paymentMethod,
    this.paymentGateway,
    this.paymentGatewayOrderId,
    required this.shippingAddress,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
    this.paymentTransaction,
  });

  @override
  List<Object?> get props => [
    id,
    totalAmount,
    status,
    paymentMethod,
    paymentGateway,
    paymentGatewayOrderId,
    shippingAddress,
    notes,
    createdAt,
    updatedAt,
    items,
    paymentTransaction,
  ];
}

class OrderItemEntity extends Equatable {
  final String id;
  final String productId;
  final int quantity;
  final double priceAtPurchase;
  final double total;
  final String createdAt;
  final ProductInOrderEntity product;

  const OrderItemEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.priceAtPurchase,
    required this.total,
    required this.createdAt,
    required this.product,
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    quantity,
    priceAtPurchase,
    total,
    createdAt,
    product,
  ];
}

class ProductInOrderEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  const ProductInOrderEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];
}

class ShippingAddressEntity extends Equatable {
  final String city;
  final String country;
  final String? street;
  final String? postalCode;
  final String? phone;

  const ShippingAddressEntity({
    required this.city,
    required this.country,
    this.street,
    this.postalCode,
    this.phone,
  });

  @override
  List<Object?> get props => [city, country, street, postalCode, phone];
}

class PaymentTransactionEntity extends Equatable {
  final String id;
  final String transactionId;
  final double amount;
  final String currency;
  final String status;
  final String paymentMethod;
  final String createdAt;
  final String updatedAt;

  const PaymentTransactionEntity({
    required this.id,
    required this.transactionId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    transactionId,
    amount,
    currency,
    status,
    paymentMethod,
    createdAt,
    updatedAt,
  ];
}

class PaginationEntity extends Equatable {
  final int currentPage;
  final int from;
  final int lastPage;
  final int perPage;
  final int to;
  final int total;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String? path;

  const PaginationEntity({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.path,
  });

  @override
  List<Object?> get props => [
    currentPage,
    from,
    lastPage,
    perPage,
    to,
    total,
    firstPageUrl,
    lastPageUrl,
    nextPageUrl,
    prevPageUrl,
    path,
  ];
}
