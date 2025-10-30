import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config/routes/route_manager.dart';

class PaymentService {
  // Singleton instance
  static final PaymentService _instance = PaymentService._internal();

  // Private constructor for singleton
  PaymentService._internal();

  factory PaymentService() {
    return _instance;
  }

  // Fields for configuration
  late BuildContext _context;
  late String _url;
  late Function(String) _onError;

  // Method to initialize the service
  void initialize({
    required BuildContext context,
    required String url,
    required Function(String) onError,
  }) {
    _context = context;
    _url = url;
    _onError = onError;
  }

  WebViewController createPaymentController() {
    String message = '';
    String status = '';

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (url.contains('callback')) {
              Uri uri = Uri.parse(url);
              status = uri.queryParameters['status'] ?? '';
              message = uri.queryParameters['message'] ?? '';

              // Handle successful payment
              if (status.isNotEmpty && status == 'paid') {
                _navigateToSuccessScreen();
              } else {
                _handleError(message);
              }
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(_url));

    return controller;
  }

  void _navigateToSuccessScreen() {
    // RouteManager.rPushNamedAndRemoveUntil(
    //   context: _context,
    //   rName: ,
    // arguments:
    // );
  }

  void _handleError(String message) {
    // Close current route and show an error dialog
    RouteManager.rPopRoute(_context);
    showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message.isNotEmpty
                ? message
                : 'لقد حدث خطأ٫ برجاء المحاولة في وقت لاحق',
            style: context.typography.titleMedium,
          ),
        );
      },
    );

    // Trigger the error callback
    _onError(message);
  }
}
