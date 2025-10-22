import 'package:flutter/material.dart';

class NotificationRouterStrategy {
  void route(
    Map<String, dynamic> data,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    final type = data['type'];

    switch (type) {
      case 'order':
        navigatorKey.currentState?.pushNamed(
          '/order',
          arguments: data['orderId'],
        );
        break;
      case 'chat':
        navigatorKey.currentState?.pushNamed(
          '/chat',
          arguments: data['chatId'],
        );
        break;
      default:
        navigatorKey.currentState?.pushNamed('/notification');
    }
  }
}
