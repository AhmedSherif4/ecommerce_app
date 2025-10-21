import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationInitializer {
  static Future<void> requestPermissions(FirebaseMessaging messaging) async {
    await messaging.requestPermission(alert: true, badge: true, sound: true);
    await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }

  static Future<void> registerBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("📥 [BG] ${message.notification?.title}");
  }
}
