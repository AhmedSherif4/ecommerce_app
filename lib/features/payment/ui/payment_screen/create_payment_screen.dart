import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/features/payment/payment.dart';
import 'package:ecommerce_app/features/payment/ui/payment_screen/initiate_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePaymentScreen extends StatefulWidget {
  final String? orderId;

  const CreatePaymentScreen({super.key, this.orderId});

  @override
  State<CreatePaymentScreen> createState() => _CreatePaymentScreenState();
}

class _CreatePaymentScreenState extends State<CreatePaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _orderIdController = TextEditingController();
  final _amountController = TextEditingController();

  String _selectedGateway = 'stripe';
  String _selectedCurrency = 'EGP';

  final List<String> _paymentGateways = ['stripe', 'paypal', 'fawry'];
  final List<String> _currencies = ['EGP', 'USD', 'EUR'];

  @override
  void initState() {
    super.initState();
    if (widget.orderId != null) {
      _orderIdController.text = widget.orderId!;
    }
  }

  @override
  void dispose() {
    _orderIdController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _createPayment() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء عملية دفع'),
          backgroundColor: Colors.green,
        ),
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state.createPaymentState == RequestStates.loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.createPaymentMessage),
                  backgroundColor: Colors.green,
                ),
              );
              // عرض تفاصيل الدفع
              if (state.paymentEntity != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('تم إنشاء عملية الدفع بنجاح'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(
                            'Transaction ID:',
                            state.paymentEntity!.transactionId,
                          ),
                          _buildInfoRow('Status:', state.paymentEntity!.status),
                          _buildInfoRow(
                            'Amount:',
                            '${state.paymentEntity!.amount} ${state.paymentEntity!.currency}',
                          ),
                          if (state.paymentEntity!.paymentUrl != null)
                            _buildInfoRow(
                              'Payment URL:',
                              state.paymentEntity!.paymentUrl!,
                            ),
                          _buildInfoRow(
                            'Client Secret:',
                            state.paymentEntity!.clientSecret,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // الانتقال لشاشة initiate payment
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InitiatePaymentScreen(
                                orderId: _orderIdController.text,
                                transactionId:
                                    state.paymentEntity!.transactionId,
                                amount: state.paymentEntity!.amount,
                                paymentGateway: _selectedGateway,
                              ),
                            ),
                          );
                        },
                        child: const Text('تأكيد الدفع'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('إغلاق'),
                      ),
                    ],
                  ),
                );
              }
            } else if (state.createPaymentState == RequestStates.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.createPaymentMessage),
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
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'بيانات الدفع',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Order ID
                              TextFormField(
                                controller: _orderIdController,
                                decoration: const InputDecoration(
                                  labelText: 'رقم الطلب *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.receipt_long),
                                  hintText: 'أدخل رقم الطلب',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'من فضلك أدخل رقم الطلب';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Amount
                              TextFormField(
                                controller: _amountController,
                                decoration: const InputDecoration(
                                  labelText: 'المبلغ *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.attach_money),
                                  hintText: 'أدخل المبلغ',
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'من فضلك أدخل المبلغ';
                                  }
                                  if (double.tryParse(value) == null) {
                                    return 'من فضلك أدخل مبلغ صحيح';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Payment Gateway
                              DropdownButtonFormField<String>(
                                initialValue: _selectedGateway,
                                decoration: const InputDecoration(
                                  labelText: 'بوابة الدفع *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.payment),
                                ),
                                items: _paymentGateways.map((gateway) {
                                  return DropdownMenuItem(
                                    value: gateway,
                                    child: Text(gateway.toUpperCase()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGateway = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 16),

                              // Currency
                              DropdownButtonFormField<String>(
                                initialValue: _selectedCurrency,
                                decoration: const InputDecoration(
                                  labelText: 'العملة *',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.currency_exchange),
                                ),
                                items: _currencies.map((currency) {
                                  return DropdownMenuItem(
                                    value: currency,
                                    child: Text(currency),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCurrency = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // زر إنشاء الدفع
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed:
                              state.createPaymentState == RequestStates.loading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final request = CreatePaymentRequest(
                                      orderId: _orderIdController.text,
                                      amount: double.parse(
                                        _amountController.text,
                                      ),
                                      paymentGateway: _selectedGateway,
                                      currency: _selectedCurrency,
                                    );

                                    context.read<PaymentBloc>().add(
                                      CreatePaymentEvent(
                                        createPaymentRequest: request,
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child:
                              state.createPaymentState == RequestStates.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'إنشاء عملية الدفع',
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
