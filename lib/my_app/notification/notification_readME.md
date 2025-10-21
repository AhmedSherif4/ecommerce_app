
# 🔔 Flutter Notification Service (FCM + Local Notifications)

This service provides a **clean, scalable, and testable architecture** for handling notifications in Flutter apps using:

- Firebase Cloud Messaging (FCM)
- Flutter Local Notifications
- Injectable + GetIt (for dependency injection)
- Full support for Android, iOS, and Huawei fallback

---

## 📦 Features

- ✅ Works in all app states (foreground, background, terminated)
- ✅ Shows rich local notifications with custom sound
- ✅ Supports routing based on notification "type" field
- ✅ Provides FCM token for backend registration
- ✅ Handles topics: subscribe / unsubscribe
- ✅ Clean Architecture, SOLID Principles, OOP, and Service Locator

---

## 🚀 Getting Started

### 1. Add Dependencies

```yaml
dependencies:
  firebase_messaging: ^14.x.x
  flutter_local_notifications: ^15.x.x
  permission_handler: ^11.x.x
  get_it: ^7.x.x
  injectable: ^2.x.x

dev_dependencies:
  build_runner: ^2.x.x
  injectable_generator: ^2.x.x
```

---

### 2. Firebase Setup

- Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Configure Firebase via:

```bash
flutterfire configure
```

---

### 3. Android Configuration

**`AndroidManifest.xml`:**

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

**Inside `<application>`:**

```xml
<meta-data
  android:name="com.google.firebase.messaging.default_notification_channel_id"
  android:value="default_channel" />
```

**Optional: Notification Sound**

Place `notification_sound.mp3` in:
```
android/app/src/main/res/raw/
```

---

### 4. iOS Configuration

**`Info.plist`:**

```xml
<key>UIBackgroundModes</key>
<array>
  <string>remote-notification</string>
</array>
<key>NSUserTrackingUsageDescription</key>
<string>This identifier will be used to deliver notifications to you.</string>
<key>FirebaseAppDelegateProxyEnabled</key>
<false/>
```

Enable Push Notifications & Background Modes in Xcode.

---

## 🧱 Architecture Overview

```
lib/
├── core/
│   └── di/
│       └── injection.dart
│   └── services/
│       └── notification/
│           ├── i_notification_service.dart
│           ├── notification_service_impl.dart
│           ├── notification_initializer.dart
│           ├── notification_handler.dart
│           └── notification_type_factory.dart
├── features/
│   └── notification/
│       └── notification_router_strategy.dart
```

---

## 🧠 How to Use

### 1. Configure DI in `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(); // Injectable setup

  final notificationService = getIt<INotificationService>();
  await notificationService.initialize();

  runApp(MyApp(navigatorKey: getIt<GlobalKey<NavigatorState>>()));
}
```

---

### 2. Get FCM Token

```dart
final token = await getIt<INotificationService>().getDeviceToken();
print("🔥 Token: $token");
```

---

### 3. Subscribe / Unsubscribe from Topic

```dart
await getIt<INotificationService>().subscribeToTopic("news");
await getIt<INotificationService>().unsubscribeFromTopic("news");
```

---

### 4. Notification Payload Format

```json
{
  "type": "chat",
  "chatId": "12345"
}
```

- `type` determines the routing target.
- Additional arguments passed to the screen via `navigatorKey`.

---

### 5. Routing via Strategy

**Example router logic (string based):**

```dart
class NotificationRouterStrategy {
  void route(String type, GlobalKey<NavigatorState> navigatorKey, Map<String, dynamic> data) {
    switch (type) {
      case 'order':
        navigatorKey.currentState?.pushNamedAndRemoveUntil('/orderScreen', (_) => false, arguments: data['orderId']);
        break;
      case 'chat':
        navigatorKey.currentState?.pushNamedAndRemoveUntil('/chatScreen', (_) => false, arguments: data['chatId']);
        break;
      case 'notification':
        navigatorKey.currentState?.pushNamedAndRemoveUntil('/notificationScreen', (_) => false, arguments: data['notificationId']);
        break;
      default:
        navigatorKey.currentState?.pushNamed('/home');
    }
  }
}
```

---

## 🧪 Testing Tips

You can simulate routing by:

```dart
final router = getIt<NotificationRouterStrategy>();
router.route("chat", getIt<GlobalKey<NavigatorState>>(), {'chatId': '123'});
```

---

## 🛠 Future Improvements

- [ ] Scheduled local notifications
- [ ] Badge count support
- [ ] Notification grouping
- [ ] Deep linking from system tray
