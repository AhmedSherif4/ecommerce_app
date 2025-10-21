import 'dart:ui';

import 'package:ecommerce_app/core/theme_manager/domain/i_theme_repository.dart';
import 'package:hive/hive.dart';

import '../../../config/storages/keys.dart';
import '../localization_logic/localization_model.dart';

// @LazySingleton(as: IThemeRepository)
class ThemeRepository implements IThemeRepository {
  @override
  Future<void> saveThemeMode(bool isDark) async {
    final box = Hive.box(AppKeys.keyDark);
    await box.put(AppKeys.keyDark, isDark);
  }

  @override
  bool loadThemeMode() {
    final box = Hive.box(AppKeys.keyDark);
    final isDark = box.get(AppKeys.keyDark, defaultValue: false) as bool;
    return isDark;
  }

  @override
  Future<String> getAppLocale() async {
    final localeBox = Hive.box(AppKeys.keyLocale);
    final appLocale =
        localeBox.get(
              AppKeys.keyLocale,
              defaultValue: LanguageType.english.getValue(),
            )
            as String;
    return appLocale;
  }

  //todo: for Localization
  // to materialAPP
  @override
  Future<Locale> getLocale() async {
    if (await getAppLocale() == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  //todo: for Localization
  // to bloc
  @override
  Future<void> changeLocale() async {
    final box = Hive.box(AppKeys.keyLocale);
    if (await getAppLocale() == LanguageType.english.getValue()) {
      await box.put(AppKeys.keyLocale, LanguageType.arabic.getValue());
    } else {
      await box.put(AppKeys.keyLocale, LanguageType.english.getValue());
    }
  }
}
