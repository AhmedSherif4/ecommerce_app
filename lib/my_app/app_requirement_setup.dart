import 'package:ecommerce_app/features/shared_features/contact_us/domain/entity/contact_us_entity.dart';
import 'package:ecommerce_app/features/shared_features/terms_and_conditions/domain/entity/terms_and_conditions_entity.dart';
import 'package:hive_flutter/adapters.dart';

import '../config/storages/keys.dart';
import '../core/services/services_locator.dart';
import '../core/shared_models/user/user_entity/user_entity.dart';
import 'notification/i_notification_service.dart';

class AppRequirementSetup {
  AppRequirementSetup._();

  static final AppRequirementSetup _instance = AppRequirementSetup._();

  static AppRequirementSetup get instance => _instance;

  static Future<void> initialFutures() async {
    await Future.wait([
      Hive.openBox<UserEntity>(AppKeys.userData),
      Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.showcaseViewed)),
      Hive.openBox<bool>(AppKeys.showcaseViewed),
      Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.contactUs)),
      Hive.openBox<String>(
        AppKeys.getExpirationKey(AppKeys.termsAndConditions),
      ),
      getIt<INotificationService>().initialize(),
    ]);
  }

  static void registerHiveAdapter() {
    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(TermsAndConditionsEntityAdapter());
    Hive.registerAdapter(ContactUsEntityAdapter());
  }
}
