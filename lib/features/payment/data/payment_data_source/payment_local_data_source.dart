part of '../../payment.dart';

abstract class PaymentLocalDataSource {
  // save product to list of local cart
  Future<void> saveProductAtCart(ProductEntity product);
  // remove product from list of local cart
  Future<void> removeProductFromCart(ProductEntity product);
  // get all products at the cart
  Future<List<ProductEntity>> getProductsCart();
  // clear cart after order it
  Future<void> clearProductsCart();
  Future<bool> isProductInCart(String productId);
}

@LazySingleton(as: PaymentLocalDataSource)
class PaymentLocalDataSourceImpl implements PaymentLocalDataSource {
  final BaseLocalDataSource baseLocalDataSource;

  PaymentLocalDataSourceImpl({required this.baseLocalDataSource});

  @override
  Future<void> saveProductAtCart(ProductEntity product) async {
    'before get save '.log();
    final List<ProductEntity> products =
        await baseLocalDataSource.getListOfDataFromLocal<ProductEntity>(
          labelKey: AppKeys.cartBoxKey,
        ) ??
        [];
    final index = products.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      products[index] = product;
    } else {
      products.add(product);
    }
    'before save save '.log();
    await baseLocalDataSource.saveListOfDataInLocal<ProductEntity>(
      labelKey: AppKeys.cartBoxKey,
      data: products,
    );
  }

  @override
  Future<void> removeProductFromCart(ProductEntity product) async {
    'before get remove '.log();

    final products =
        await baseLocalDataSource.getListOfDataFromLocal<ProductEntity>(
          labelKey: AppKeys.cartBoxKey,
        ) ??
        [];
    products.removeWhere((p) => p.id == product.id);
    'before save remove '.log();
    await baseLocalDataSource.saveListOfDataInLocal<ProductEntity>(
      labelKey: AppKeys.cartBoxKey,
      data: products,
    );
  }

  @override
  Future<List<ProductEntity>> getProductsCart() async {
    final products = await baseLocalDataSource
        .getListOfDataFromLocal<ProductEntity>(labelKey: AppKeys.cartBoxKey);

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
    await baseLocalDataSource.deleteDataAt<ProductEntity>(AppKeys.cartBoxKey);
  }

  @override
  Future<bool> isProductInCart(String productId) async {
    final products = await baseLocalDataSource
        .getListOfDataFromLocal<ProductEntity>(labelKey: AppKeys.cartBoxKey);
    if (products != null) {
      print('عدد المنتجات: ${products.length}');
      return products.any((product) => product.id == productId);
    } else {
      print('السلة فارغة أو انتهت صلاحية البيانات');
      return false;
    }
  }
}
