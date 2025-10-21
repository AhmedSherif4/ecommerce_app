import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

abstract class IAppUpdateService {
  Future<String> getCurrentVersion();
  Future<String> getStoreVersion();
  Future<bool> isUpdateAvailable();
}

class AppUpdateService implements IAppUpdateService {
  final String androidPackageId;
  final String iosBundleId;

  AppUpdateService({required this.androidPackageId, required this.iosBundleId});

  @override
  Future<String> getCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  Future<String> getStoreVersion() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _getAndroidStoreVersion();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _getiOSStoreVersion();
    } else {
      return '0.0.0';
    }
  }

  @override
  Future<bool> isUpdateAvailable() async {
    final current = await getCurrentVersion();
    final store = await getStoreVersion();

    return _compareVersions(current, store) < 0;
  }

  Future<String> _getiOSStoreVersion() async {
    try {
      final uri = Uri.parse(
        'https://itunes.apple.com/lookup?bundleId=$iosBundleId',
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['resultCount'] > 0) {
          return data['results'][0]['version'];
        }
      }
    } catch (e) {
      debugPrint('Error fetching iOS version: $e');
    }
    return '0.0.0';
  }

  Future<String> _getAndroidStoreVersion() async {
    try {
      final uri = Uri.https('play.google.com', '/store/apps/details', {
        'id': androidPackageId,
        'hl': 'en_US',
        'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      });

      final response = await http.get(uri);
      if (response.statusCode != 200) return '0.0.0';

      final regex = RegExp(r'\[\[\[\"(\d+\.\d+(\.\d+)?([^\"]*)?)\"\]\]');
      final match = regex.firstMatch(response.body);

      return match?.group(1) ?? '0.0.0';
    } catch (e) {
      debugPrint('Error fetching Android version: $e');
      return '0.0.0';
    }
  }

  int _compareVersions(String v1, String v2) {
    final v1Parts = v1.split('.').map(int.tryParse).toList();
    final v2Parts = v2.split('.').map(int.tryParse).toList();

    for (var i = 0; i < 3; i++) {
      final p1 = (v1Parts.length > i ? (v1Parts[i] ?? 0) : 0);
      final p2 = (v2Parts.length > i ? (v2Parts[i] ?? 0) : 0);

      if (p1 < p2) return -1;
      if (p1 > p2) return 1;
    }
    return 0;
  }
}

/*

// ------------------------------------------------------------
// ✅ طريقة الاستخدام:
// ------------------------------------------------------------

// 1️⃣ أولًا: أنشئ نسخة من الخدمة مع تحديد الـ bundle IDs:
final updateService = AppUpdateService(
  androidPackageId: 'com.edu_tasses.ecommerce_app',               // ✅ استبدلها بالـ Android package ID الخاص بتطبيقك
  iosBundleId: 'com.edutasses.tasesseApplication',              // ✅ استبدلها بالـ iOS bundle ID الخاص بتطبيقك
);

// 2️⃣ ثانيًا: جلب رقم الإصدار الحالي للتطبيق من الجهاز:
final currentVersion = await updateService.getCurrentVersion();
print('🔸 Current Version: $currentVersion');

// 3️⃣ ثالثًا: جلب رقم الإصدار الموجود على المتجر (Play Store / App Store):
final storeVersion = await updateService.getStoreVersion();
print('🔹 Store Version: $storeVersion');

// 4️⃣ رابعًا: التحقق هل يوجد تحديث جديد:
final hasUpdate = await updateService.isUpdateAvailable();
print('⚠️ Update Available: $hasUpdate');

// ✅ بناءً على القيمة `hasUpdate`، يمكنك عرض Dialog أو توجيه المستخدم للتحديث.

 */
