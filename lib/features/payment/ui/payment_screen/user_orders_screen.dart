import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/features/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrdersScreen extends StatefulWidget {
  const UserOrdersScreen({super.key});

  @override
  State<UserOrdersScreen> createState() => _UserOrdersScreenState();
}

class _UserOrdersScreenState extends State<UserOrdersScreen> {
  int _currentPage = 1;
  final int _limitPerPage = 10;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    final request = GetUserOrdersRequest(
      page: _currentPage,
      limitPerPage: _limitPerPage,
    );
    context.read<PaymentBloc>().add(
      GetUserOrdersEvent(getUserOrdersRequest: request),
    );
  }

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
    _loadOrders();
  }

  void _previousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
      _loadOrders();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلباتي'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadOrders),
        ],
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.getUserOrdersState == RequestStates.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.getUserOrdersState == RequestStates.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.getUserOrdersMessage,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadOrders,
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            );
          } else if (state.getUserOrdersState == RequestStates.loaded) {
            if (state.userOrders.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'لا توجد طلبات حتى الآن',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.userOrders.length,
                    itemBuilder: (context, index) {
                      final order = state.userOrders[index];
                      return OrderCard(order: order);
                    },
                  ),
                ),
                // Pagination Controls
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _currentPage > 1 ? _previousPage : null,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('السابق'),
                      ),
                      Text(
                        'صفحة $_currentPage',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: state.userOrders.length >= _limitPerPage
                            ? _nextPage
                            : null,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('التالي'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text('ابدأ بتحميل الطلبات'));
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(order: order),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'طلب #${order.id.substring(0, 8)}...',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusChip(order.status),
                ],
              ),
              const Divider(height: 20),

              // Amount and Items Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 20,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${order.totalAmount} جنيه',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.shopping_cart, size: 20),
                      const SizedBox(width: 4),
                      Text('${order.items.length} منتج'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Shipping Address
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${order.shippingAddress.city}, ${order.shippingAddress.country}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(order.createdAt),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              // Payment Info
              if (order.paymentGateway != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.payment, size: 18, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      order.paymentGateway!.toUpperCase(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'pending':
        color = Colors.orange;
        break;
      case 'processing':
        color = Colors.blue;
        break;
      case 'completed':
        color = Colors.green;
        break;
      case 'cancelled':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        _getStatusName(status),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  String _getStatusName(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'قيد الانتظار';
      case 'processing':
        return 'قيد المعالجة';
      case 'completed':
        return 'مكتمل';
      case 'cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.year}/${date.month}/${date.day}';
  }
}

// Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الطلب'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Info Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'معلومات الطلب',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildInfoRow('رقم الطلب', order.id),
                    _buildInfoRow('الحالة', _getStatusName(order.status)),
                    _buildInfoRow(
                      'المبلغ الإجمالي',
                      '${order.totalAmount} جنيه',
                    ),
                    _buildInfoRow(
                      'تاريخ الإنشاء',
                      _formatDate(order.createdAt),
                    ),
                    _buildInfoRow('آخر تحديث', _formatDate(order.updatedAt)),
                    if (order.paymentGateway != null)
                      _buildInfoRow('بوابة الدفع', order.paymentGateway!),
                    if (order.paymentMethod != null)
                      _buildInfoRow('طريقة الدفع', order.paymentMethod!),
                    if (order.notes != null)
                      _buildInfoRow('ملاحظات', order.notes!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Shipping Address Card
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    _buildInfoRow('المدينة', order.shippingAddress.city),
                    _buildInfoRow('الدولة', order.shippingAddress.country),
                    if (order.shippingAddress.street != null)
                      _buildInfoRow('الشارع', order.shippingAddress.street!),
                    if (order.shippingAddress.postalCode != null)
                      _buildInfoRow(
                        'الرمز البريدي',
                        order.shippingAddress.postalCode!,
                      ),
                    if (order.shippingAddress.phone != null)
                      _buildInfoRow('الهاتف', order.shippingAddress.phone!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Items Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المنتجات',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order.items.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = order.items[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.product.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported),
                                );
                              },
                            ),
                          ),
                          title: Text(
                            item.product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('الكمية: ${item.quantity}'),
                              Text('السعر: ${item.priceAtPurchase} جنيه'),
                            ],
                          ),
                          trailing: Text(
                            '${item.total} جنيه',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Transaction Card
            if (order.paymentTransaction != null)
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'معلومات الدفع',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                      _buildInfoRow(
                        'Transaction ID',
                        order.paymentTransaction!.transactionId,
                      ),
                      _buildInfoRow(
                        'المبلغ',
                        '${order.paymentTransaction!.amount} ${order.paymentTransaction!.currency}',
                      ),
                      _buildInfoRow('الحالة', order.paymentTransaction!.status),
                      _buildInfoRow(
                        'طريقة الدفع',
                        order.paymentTransaction!.paymentMethod,
                      ),
                      _buildInfoRow(
                        'تاريخ الدفع',
                        _formatDate(order.paymentTransaction!.createdAt),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  String _getStatusName(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'قيد الانتظار';
      case 'processing':
        return 'قيد المعالجة';
      case 'completed':
        return 'مكتمل';
      case 'cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}';
  }
}
