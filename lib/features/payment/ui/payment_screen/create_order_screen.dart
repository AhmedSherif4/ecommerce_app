import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/features/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  // قائمة المنتجات في السلة
  final List<CartItemData> _cartItems = [];

  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    _streetController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _addProductToCart() {
    showDialog(
      context: context,
      builder: (context) {
        String productId = '';
        int quantity = 1;
        return AlertDialog(
          title: const Text('إضافة منتج'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'معرف المنتج (Product ID)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => productId = value,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'الكمية',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => quantity = int.tryParse(value) ?? 1,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                if (productId.isNotEmpty) {
                  setState(() {
                    _cartItems.add(
                      CartItemData(productId: productId, quantity: quantity),
                    );
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

  void _createOrder() {
    if (_formKey.currentState!.validate() && _cartItems.isNotEmpty) {
      final shippingAddress = ShippingAddressModel(
        city: _cityController.text,
        country: _countryController.text,
        street: _streetController.text.isEmpty ? null : _streetController.text,
        postalCode: _postalCodeController.text.isEmpty
            ? null
            : _postalCodeController.text,
        phone: _phoneController.text.isEmpty ? null : _phoneController.text,
      );

      final request = CreateOrderRequest(
        cartItems: _cartItems
            .map(
              (item) => CartItemRequest(
                productId: item.productId,
                quantity: item.quantity,
              ),
            )
            .toList(),
        shippingAddress: shippingAddress,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
      );

      context.read<PaymentBloc>().add(
        CreateOrderEvent(createOrderRequest: request),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء طلب جديد'),
          backgroundColor: Colors.blue,
        ),
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state.createOrderState == RequestStates.loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.createOrderMessage),
                  backgroundColor: Colors.green,
                ),
              );
              // عرض تفاصيل الطلب
              if (state.createOrderEntity != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('تم إنشاء الطلب بنجاح'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('رقم الطلب: ${state.createOrderEntity!.orderId}'),
                        const SizedBox(height: 8),
                        Text(
                          'المبلغ الإجمالي: ${state.createOrderEntity!.totalAmount} جنيه',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'عدد المنتجات: ${state.createOrderEntity!.itemsCount}',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _clearForm();
                        },
                        child: const Text('حسناً'),
                      ),
                    ],
                  ),
                );
              }
            } else if (state.createOrderState == RequestStates.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.createOrderMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // قسم المنتجات
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'المنتجات في السلة',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: _addProductToCart,
                                    icon: const Icon(Icons.add),
                                    label: const Text('إضافة منتج'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              if (_cartItems.isEmpty)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text('لا توجد منتجات في السلة'),
                                  ),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _cartItems.length,
                                  itemBuilder: (context, index) {
                                    final item = _cartItems[index];
                                    return ListTile(
                                      leading: const Icon(Icons.shopping_cart),
                                      title: Text(
                                        'Product ID: ${item.productId}',
                                      ),
                                      subtitle: Text(
                                        'الكمية: ${item.quantity}',
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _cartItems.removeAt(index);
                                          });
                                        },
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // قسم عنوان الشحن
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'عنوان الشحن',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  labelText: 'المدينة *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.location_city),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'من فضلك أدخل المدينة';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _countryController,
                                decoration: const InputDecoration(
                                  labelText: 'الدولة *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.flag),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'من فضلك أدخل الدولة';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _streetController,
                                decoration: const InputDecoration(
                                  labelText: 'الشارع (اختياري)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.home),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _postalCodeController,
                                decoration: const InputDecoration(
                                  labelText: 'الرمز البريدي (اختياري)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.markunread_mailbox),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  labelText: 'رقم الهاتف (اختياري)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // قسم الملاحظات
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ملاحظات الطلب',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _notesController,
                                decoration: const InputDecoration(
                                  labelText: 'ملاحظات (اختياري)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.note),
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // زر إنشاء الطلب
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed:
                              state.createOrderState == RequestStates.loading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate() &&
                                      _cartItems.isNotEmpty) {
                                    final shippingAddress =
                                        ShippingAddressModel(
                                          city: _cityController.text,
                                          country: _countryController.text,
                                          street: _streetController.text.isEmpty
                                              ? null
                                              : _streetController.text,
                                          postalCode:
                                              _postalCodeController.text.isEmpty
                                              ? null
                                              : _postalCodeController.text,
                                          phone: _phoneController.text.isEmpty
                                              ? null
                                              : _phoneController.text,
                                        );

                                    final request = CreateOrderRequest(
                                      cartItems: _cartItems
                                          .map(
                                            (item) => CartItemRequest(
                                              productId: item.productId,
                                              quantity: item.quantity,
                                            ),
                                          )
                                          .toList(),
                                      shippingAddress: shippingAddress,
                                      notes: _notesController.text.isEmpty
                                          ? null
                                          : _notesController.text,
                                    );

                                    context.read<PaymentBloc>().add(
                                      CreateOrderEvent(
                                        createOrderRequest: request,
                                      ),
                                    );
                                  }
                                },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state.createOrderState == RequestStates.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'إنشاء الطلب',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _clearForm() {
    _cityController.clear();
    _countryController.clear();
    _streetController.clear();
    _postalCodeController.clear();
    _phoneController.clear();
    _notesController.clear();
    setState(() {
      _cartItems.clear();
    });
  }
}

class CartItemData {
  final String productId;
  final int quantity;

  CartItemData({required this.productId, required this.quantity});
}
