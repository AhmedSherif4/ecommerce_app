import 'package:hive/hive.dart';

import '../../../../core/shared_models/product/product_entity.dart';

part 'cart_item_request.g.dart';

@HiveType(typeId: 6)
class CartItemRequest {
  @HiveField(0)
  final ProductEntity product;
  @HiveField(1)
  final int quantity;

  const CartItemRequest({required this.product, this.quantity = 1});

  Map<String, dynamic> toJson() {
    return {'product_id': product.id, 'quantity': quantity};
  }

  double get totalPrice {
    double price = product.hasOffer ? product.priceAfterOffer : product.price;
    return price * quantity;
  }

  CartItemRequest copyWith({ProductEntity? product, int? quantity}) {
    return CartItemRequest(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItemRequest &&
        other.product.id == product.id &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.id.hashCode ^ quantity.hashCode;
}
