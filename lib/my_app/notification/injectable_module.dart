import 'package:ecommerce_app/my_app/notification/i_notification_service.dart';
import 'package:ecommerce_app/my_app/notification/notification_handler.dart';
import 'package:ecommerce_app/my_app/notification/notification_initializer.dart';
import 'package:ecommerce_app/my_app/notification/notification_router_strategy.dart';
import 'package:ecommerce_app/my_app/notification/notification_service_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NotificationInjectableModule {
  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @lazySingleton
  FlutterLocalNotificationsPlugin get localNotif =>
      FlutterLocalNotificationsPlugin();

  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @lazySingleton
  NotificationRouterStrategy get notificationRouterStrategy =>
      NotificationRouterStrategy();

  @lazySingleton
  NotificationInitializer get notificationInitializer =>
      NotificationInitializer();

  @lazySingleton
  LocalNotificationHandler get localNotificationHandler =>
      LocalNotificationHandler();

  @lazySingleton
  INotificationService get notificationService => NotificationServiceImpl(
    messaging: firebaseMessaging,
    localHandler: localNotificationHandler,
    router: notificationRouterStrategy,
    navigatorKey: navigatorKey,
  );
}
