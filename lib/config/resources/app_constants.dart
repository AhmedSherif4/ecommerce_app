abstract class AppConstants {
  // app constant here
  static const int appLocalDurationInDays = 7;
  static const int appLocalDurationInHours = 1;
  static const int tokenLocalDurationInDays = 365;

  //Button Size
  //ToDo : Remove Sizing from here to ISpacingConfig
  static const double buttonWidth = 341;
  static const double buttonHeight = 54;
  static const double iconButtonWidth = 40;
  static const double iconButtonHeight = 40;
  static const double iconButtonSizeS20 = 24;

  //App Border Radius
  //ToDo : Remove Sizing from here to AppBorderRadius
  static const double appBorderRadiusR10 = 10;
  static const double appBorderRadiusR15 = 15;
  static const double appBorderRadiusR20 = 20;
  static const double appBorderRadiusR25 = 25;
  static const double appBorderRadiusR30 = 30;
  static const double appBorderRadiusR35 = 35;
  static const double appBorderRadiusR40 = 40;
  static const double textInputFieldBorderRadiusR35 = 35;
  static const double appBorderSideWidthR1 = 1;

  // App Elevation
  static const double appElevationR8 = 8;

  // Scaffold Padding
  //ToDo : Remove Sizing from here we have AppPadding
  static const double appPaddingR20 = 20;
  static const double appPaddingR10 = 10;

  //ToDo : Remove Sizing from here we have ISpacingConfig
  static const double iconSizeS20 = 20;

  //ToDo : Remove Sizing from here we have ISpacingConfig
  static const double appLogoHeight = 110;
  static const double appLogoWidth = 110;

  static const String primaryColorHexCode = '#1F477A';
  static const Duration durationOfConfetti = Duration(milliseconds: 100);
  static const Duration animationTime = Duration(milliseconds: 700);
  // static TextStyle quranStyle = const AppTextStyle().s16.w200.quranFont.titleMedium20;
  // static TextDirection arabicDirection(text) =>
  //     AppReference.detectStringType(text) == StringType.english
  //         ? TextDirection.ltr
  //         : TextDirection.rtl;
  // static String quranFamily(text) =>
  //     AppReference.detectStringType(text) == StringType.quranicArabic
  //         ? AppTextStyle.quranFont
  //         : AppTextStyle.balooBhaijaan2;

  // static BoxDecoration containerDecoration({
  //   Color? backgroundColor,
  // }) =>
  //     BoxDecoration(
  //       borderRadius: BorderRadius.circular(
  //         AppConstants.appBorderRadiusR20.responsiveSize,
  //       ),
  //       color: backgroundColor ?? AppColors.textColor6,
  //       boxShadow: [AppShadow.appBoxShadow()],
  //     );
}
