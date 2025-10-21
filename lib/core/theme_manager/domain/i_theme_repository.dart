import 'dart:ui';

abstract class IThemeRepository {
  Future<void> saveThemeMode(bool isDark);
  bool loadThemeMode();

  Future<String> getAppLocale();
  Future<Locale> getLocale();
  Future<void> changeLocale();
}
