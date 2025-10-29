part of '../../cart.dart';

//? Fluent Interface Pattern

class CartSummary {
  final double subTotal;
  final double vat;
  final double shippingFee;
  final double total;

  CartSummary._({
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  static CartCalculatorBuilder builder() => CartCalculatorBuilder();

  @override
  String toString() {
    return 'CartSummary(subTotal: $subTotal, vat: $vat, shippingFee: $shippingFee, total: $total)';
  }
}

class CartCalculatorBuilder {
  List<CartItemRequest> _products = [];
  double _vatPercentage = 18;
  double _shippingFee = 20;

  CartCalculatorBuilder withProducts(List<CartItemRequest> products) {
    _products = products;
    return this;
  }

  CartCalculatorBuilder addProduct(CartItemRequest product) {
    _products.add(product);
    return this;
  }

  CartCalculatorBuilder removeProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
    }
    return this;
  }

  CartCalculatorBuilder clearProducts() {
    _products.clear();
    return this;
  }

  CartCalculatorBuilder withVATPercentage(double percentage) {
    _vatPercentage = percentage;
    return this;
  }

  CartCalculatorBuilder withShippingFee(double fee) {
    _shippingFee = fee;
    return this;
  }

  CartCalculatorBuilder applyFreeShipping() {
    _shippingFee = 0;
    return this;
  }

  CartCalculatorBuilder applyDiscount(double discountPercentage) {
    // if there's a coupon for discount
    return this;
  }

  double _calculateSubTotal() {
    return _products.fold(0.0, (sum, item) {
      double price = item.product.hasOffer
          ? item.product.priceAfterOffer
          : item.product.price;
      return sum + (price * item.quantity);
    });
  }

  double _calculateVAT(double subTotal) {
    return subTotal * (_vatPercentage / 100);
  }

  double _calculateTotal(double subTotal, double vat) {
    return subTotal + vat + _shippingFee;
  }

  CartSummary calculate() {
    final subTotal = _calculateSubTotal();
    final vat = _calculateVAT(subTotal);
    final total = _calculateTotal(subTotal, vat);

    return CartSummary._(
      subTotal: subTotal,
      vat: vat,
      shippingFee: _shippingFee,
      total: total,
    );
  }
}
