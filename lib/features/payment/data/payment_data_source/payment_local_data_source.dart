part of '../../payment.dart';

abstract class PaymentLocalDataSource {
  // save product to list of local cart
  Future<void> saveProductAtCart(CartItemRequest product);
  // remove product from list of local cart
  Future<void> removeProductFromCart(CartItemRequest product);
  Future<List<CartItemRequest>> updateProductAtCart(
    CartItemRequest product,
    int index,
  );
  // get all products at the cart
  Future<List<CartItemRequest>> getProductsCart();
  // clear cart after order it
  Future<void> clearProductsCart();
  Future<bool> isProductInCart(String productId);
}

@LazySingleton(as: PaymentLocalDataSource)
class PaymentLocalDataSourceImpl implements PaymentLocalDataSource {
  final BaseLocalDataSource baseLocalDataSource;

  PaymentLocalDataSourceImpl({required this.baseLocalDataSource});

  @override
  Future<void> saveProductAtCart(CartItemRequest product) async {
    'before get save '.log();
    final List<CartItemRequest> products =
        await baseLocalDataSource.getListOfDataFromLocal<CartItemRequest>(
          labelKey: AppKeys.cartBoxKey,
        ) ??
        [];
    final index = products.indexWhere(
      (p) => p.product.id == product.product.id,
    );
    if (index >= 0) {
      products[index] = product;
    } else {
      products.add(product);
    }
    'before save save '.log();
    await baseLocalDataSource.saveListOfDataInLocal<CartItemRequest>(
      labelKey: AppKeys.cartBoxKey,
      data: products,
    );
  }

  @override
  Future<void> removeProductFromCart(CartItemRequest product) async {
    'before get remove '.log();

    final products =
        await baseLocalDataSource.getListOfDataFromLocal<CartItemRequest>(
          labelKey: AppKeys.cartBoxKey,
        ) ??
        [];
    products.removeWhere((p) => p.product.id == product.product.id);
    'before save remove '.log();
    await baseLocalDataSource.saveListOfDataInLocal<CartItemRequest>(
      labelKey: AppKeys.cartBoxKey,
      data: products,
    );
  }

  @override
  Future<List<CartItemRequest>> getProductsCart() async {
    final products = await baseLocalDataSource
        .getListOfDataFromLocal<CartItemRequest>(labelKey: AppKeys.cartBoxKey);

    if (products != null) {
      print('عدد المنتجات: ${products.length}');
      return products;
    } else {
      print('السلة فارغة أو انتهت صلاحية البيانات');
      return [];
    }
  }

  @override
  Future<void> clearProductsCart() async {
    await baseLocalDataSource.deleteDataAt<CartItemRequest>(AppKeys.cartBoxKey);
  }

  @override
  Future<bool> isProductInCart(String productId) async {
    final products = await baseLocalDataSource
        .getListOfDataFromLocal<CartItemRequest>(labelKey: AppKeys.cartBoxKey);
    if (products != null) {
      print('عدد المنتجات: ${products.length}');
      return products.any((product) => product.product.id == productId);
    } else {
      print('السلة فارغة أو انتهت صلاحية البيانات');
      return false;
    }
  }

  @override
  Future<List<CartItemRequest>> updateProductAtCart(
    CartItemRequest product,
    int index,
  ) async {
    await baseLocalDataSource.updateListDataInLocal<CartItemRequest>(
      index: index,
      labelKey: AppKeys.cartBoxKey,
      updatedData: product,
    );
    return getProductsCart();
  }
}
