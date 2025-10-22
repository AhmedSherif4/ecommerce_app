import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'i_notification_service.dart';
import 'notification_handler.dart';
import 'notification_initializer.dart';
import 'notification_router_strategy.dart';

class NotificationServiceImpl implements INotificationService {
  final FirebaseMessaging _messaging;
  final LocalNotificationHandler _localHandler;
  final NotificationRouterStrategy _router;
  final GlobalKey<NavigatorState> _navigatorKey;

  NotificationServiceImpl({
    required FirebaseMessaging messaging,
    required LocalNotificationHandler localHandler,
    required NotificationRouterStrategy router,
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _messaging = messaging,
       _localHandler = localHandler,
       _router = router,
       _navigatorKey = navigatorKey;

  @override
  Future<void> initialize() async {
    await NotificationInitializer.requestPermissions(_messaging);
    await _localHandler.init();
    await NotificationInitializer.registerBackgroundHandler();
    await _registerHandlers();
  }

  Future<void> _registerHandlers() async {
    final message = await _messaging.getInitialMessage();

    if (message != null) _router.route(message.data, _navigatorKey);

    FirebaseMessaging.onMessage.listen((msg) {
      _localHandler.showNotification(msg);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      _router.route(msg.data, _navigatorKey);
    });
  }

  @override
  Future<void> subscribeToTopic(String topic) =>
      _messaging.subscribeToTopic(topic);

  @override
  Future<void> unsubscribeFromTopic(String topic) =>
      _messaging.unsubscribeFromTopic(topic);

  @override
  Future<String> getDeviceToken() {
    return _messaging.getToken().then((token) {
      if (token == null) {
        return Future.error('Failed to get device token');
      }
      return token;
    });
  }
}
