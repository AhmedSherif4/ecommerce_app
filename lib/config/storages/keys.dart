class AppKeys {
  static const String supabaseURL = 'SUPABASE_URL';
  static const String supabaseAnonKey = 'SUPABASE_ANON_KEY';
  static const String cartBoxKey = 'cart_products';

  static const keyDark = 'isDark';
  static const completeProfile = 'completeProfile';
  static const keyLocale = 'locale';
  static const String onBoardingViewed = 'onBoardingViewed';
  static const String showcaseViewed = 'showcaseViewed';

  static const String accessToken = 'accessToken';

  static const String userData = 'userData';

  static const String contactUs = 'contactUs';

  static const String iosDeviceID = 'iosDeviceID';

  static const String termsAndConditions = 'termsAndConditions';

  static String getExpirationKey(String labelKey) =>
      '$labelKey'
      '_expiration';
}
