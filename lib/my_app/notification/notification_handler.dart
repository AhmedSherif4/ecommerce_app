import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationHandler {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (resp) {
        final data = jsonDecode(resp.payload ?? '{}');
      },
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            'default_channel',
            'App Notifications',
            importance: Importance.max,
          ),
        );
  }

  Future<void> showNotification(RemoteMessage message) async {
    final notif = message.notification;
    if (notif == null) return;

    await _plugin.show(
      notif.hashCode,
      notif.title,
      notif.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel',
          'App Notifications',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.data),
    );
  }
}
