import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/features/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitiatePaymentScreen extends StatefulWidget {
  final String orderId;
  final String transactionId;
  final double amount;
  final String paymentGateway;

  const InitiatePaymentScreen({
    super.key,
    required this.orderId,
    required this.transactionId,
    required this.amount,
    required this.paymentGateway,
  });

  @override
  State<InitiatePaymentScreen> createState() => _InitiatePaymentScreenState();
}

class _InitiatePaymentScreenState extends State<InitiatePaymentScreen> {
  String _selectedPaymentMethod = 'card';
  String _selectedStatus = 'pending';

  final List<String> _paymentMethods = ['card', 'cash', 'wallet'];
  final List<String> _paymentStatuses = ['pending', 'completed', 'failed'];

  void _initiatePayment() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تأكيد الدفع'),
          backgroundColor: Colors.orange,
        ),
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state.initiatePaymentState == RequestStates.loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.initiatePaymentMessage),
                  backgroundColor: Colors.green,
                ),
              );
              // عرض نتيجة التأكيد
              if (state.initiatePaymentEntity != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('تم تسجيل الدفع بنجاح'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'رقم الطلب: ${state.initiatePaymentEntity!.orderId}',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Transaction ID: ${state.initiatePaymentEntity!.transactionId}',
                        ),
                        const SizedBox(height: 8),
                        Text('الحالة: ${state.initiatePaymentEntity!.status}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context); // العودة للشاشة السابقة
                        },
                        child: const Text('حسناً'),
                      ),
                    ],
                  ),
                );
              }
            } else if (state.initiatePaymentState == RequestStates.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.initiatePaymentMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // بيانات الطلب
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'بيانات الطلب',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(height: 30),
                            _buildInfoRow(
                              Icons.receipt,
                              'رقم الطلب',
                              widget.orderId,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              Icons.payment,
                              'Transaction ID',
                              widget.transactionId,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              Icons.attach_money,
                              'المبلغ',
                              '${widget.amount} جنيه',
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              Icons.account_balance,
                              'بوابة الدفع',
                              widget.paymentGateway.toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // إعدادات الدفع
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'إعدادات الدفع',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Payment Method
                            DropdownButtonFormField<String>(
                              initialValue: _selectedPaymentMethod,
                              decoration: const InputDecoration(
                                labelText: 'طريقة الدفع',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.payment),
                              ),
                              items: _paymentMethods.map((method) {
                                return DropdownMenuItem(
                                  value: method,
                                  child: Text(_getPaymentMethodName(method)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 16),

                            // Payment Status
                            DropdownButtonFormField<String>(
                              initialValue: _selectedStatus,
                              decoration: const InputDecoration(
                                labelText: 'حالة الدفع',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.info),
                              ),
                              items: _paymentStatuses.map((status) {
                                return DropdownMenuItem(
                                  value: status,
                                  child: Text(_getStatusName(status)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedStatus = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // زر تأكيد الدفع
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            state.initiatePaymentState == RequestStates.loading
                            ? null
                            : () {
                                final request = InitiatePaymentRequest(
                                  pOrderId: widget.orderId,
                                  pPaymentGateway: widget.paymentGateway,
                                  pTransactionId: widget.transactionId,
                                  pAmount: widget.amount,
                                  pPaymentMethod: _selectedPaymentMethod,
                                  pStatus: _selectedStatus,
                                );

                                context.read<PaymentBloc>().add(
                                  InitiatePaymentEvent(
                                    initiatePaymentRequest: request,
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:
                            state.initiatePaymentState == RequestStates.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'تأكيد الدفع',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.orange),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getPaymentMethodName(String method) {
    switch (method) {
      case 'card':
        return 'بطاقة ائتمان';
      case 'cash':
        return 'كاش';
      case 'wallet':
        return 'محفظة إلكترونية';
      default:
        return method;
    }
  }

  String _getStatusName(String status) {
    switch (status) {
      case 'pending':
        return 'قيد الانتظار';
      case 'completed':
        return 'مكتمل';
      case 'failed':
        return 'فشل';
      default:
        return status;
    }
  }
}
