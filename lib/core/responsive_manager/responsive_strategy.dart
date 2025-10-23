/// Interface for spacing tokens (raw values only)
abstract class ISpacingConfig {
  double get cartW;

  double get cartH;

  double get s8;
  double get s16;
  double get s24;
  double get s28;
  double get s32;
  double get s50;
  double get s10;
  double get s12;
  double get s44;
  double get s5;
  double get s20;
  double get s40;
  double get s100;
  double get iconSizeS24;
  double get iconSizeS48;
  double get iconSizeS20;
  double get buttonHeight;
  double get tabBarHeight; // Default tab bar height
  double get loadingDialogHeight; // Default loading dialog height
  double get loadingDialogWidth; // Default loading dialog width

  double get verificationItemSize;

  double get sBackgroundHomeH;
  double get sImageProfile;

  double get sMyLevelContainerHomeH;
  double get splashLogo;
  double get pickYourPhoto;
  double get sStaticHeader;
  double get sChangeGradeH;
  double get cupHome;
  double get circleProgress;
  double get imageCarouselH;
  double get imageCarouselW;
  double get subjectsHomePrimaryH;
  double get subjectsHomePrimaryW;
  double get subjectsHomeH;
  double get subjectsHomeW;
  double get addTaskButtonH;
  double get addTaskH;
  double get taskWidgetH;
  double get moreOptionHomeR;
  double get progressLessonWidgetH;
  double get progressLessonWidgetW;
  double get childWidgetForParentH;
  double get buttonWidth;
  double get navBarH;
}

class MobileSpacingConfig implements ISpacingConfig {
  @override
  double get navBarH => 60.0;
  @override
  double get s16 => 16.0;
  @override
  double get s24 => 24.0;

  @override
  double get s32 => 32.0;

  @override
  double get s50 => 50.0;
  @override
  double get s10 => 10.0;
  @override
  double get s5 => 5.0;
  @override
  double get s20 => 20.0;

  @override
  double get iconSizeS24 => 24.0;

  @override
  double get s8 => 8.0;
  @override
  double get s28 => 28.0;

  @override
  double get s44 => 44.0; // Added for consistency with the TabletSpacing

  @override
  double get buttonHeight => 55.0; // Default button height

  @override
  double get s40 => 40.0; // Added for consistency with the TabletSpacing

  @override
  double get tabBarHeight => 50.0; // Default tab bar height

  @override
  double get iconSizeS20 => 20.0; // Default icon size for mobile

  @override
  double get loadingDialogHeight => 100.0; // Default loading dialog height
  @override
  double get loadingDialogWidth => 150.0; // Default loading dialog width

  @override
  double get verificationItemSize => 75.0; // Default size for verification items

  @override
  double get s12 => 12.0; // Added for consistency with the TabletSpacing

  @override
  double get sBackgroundHomeH => 250.0;

  @override
  double get sImageProfile => 45.0; // Example value for profile image size

  @override
  double get sMyLevelContainerHomeH => 30;

  @override
  double get splashLogo => 130;
  @override
  double get pickYourPhoto => 140;

  @override
  double get sStaticHeader => 30.0;

  @override
  double get sChangeGradeH => 25.0;

  @override
  double get cupHome => 16.0;
  @override
  double get circleProgress => 25.0;
  @override
  double get imageCarouselH => 122.0;
  @override
  double get imageCarouselW => 354.0;
  @override
  double get subjectsHomePrimaryH => 125.0;
  @override
  double get subjectsHomePrimaryW => 185.0;
  @override
  double get subjectsHomeH => 125.0;
  @override
  double get subjectsHomeW => 185.0;

  @override
  double get addTaskButtonH => 50.0;

  @override
  double get addTaskH => 50.0;

  @override
  double get taskWidgetH => 55.0;

  @override
  double get moreOptionHomeR => 40.0;

  @override
  double get childWidgetForParentH => 165;

  @override
  double get progressLessonWidgetH => 15;
  @override
  double get progressLessonWidgetW => 245;

  @override
  double get iconSizeS48 => 48;

  @override
  double get buttonWidth => 341.0;

  @override
  double get s100 => 100.0;

  @override
  double get cartH => 125;

  @override
  double get cartW => 350;
}

class TabletSpacingConfig implements ISpacingConfig {
  @override
  double get navBarH => 100.0;
  @override
  double get s16 => 24.0;
  @override
  double get s24 => 32.0;
  @override
  double get s32 => 40.0;
  @override
  double get s50 => 75.0;
  @override
  @override
  double get s10 => 15.0;
  @override
  double get s5 => 10.0;
  @override
  double get s20 => 20.0;

  @override
  double get iconSizeS24 => 36.0;

  @override
  double get s8 => 12.0;

  @override
  double get s28 => 42.0;
  @override
  double get s44 => 66.0; // Added for consistency with the MobileSpacing

  @override
  double get buttonHeight => 90.0; // Default button height for tablet

  @override
  double get s12 => 15.0; // Added for consistency with the MobileSpacing

  @override
  double get s40 => 55; // Added for consistency with the MobileSpacing

  @override
  double get tabBarHeight => 100.0; // Default tab bar height for tablet

  @override
  double get iconSizeS20 => 36.0; // Default icon size for tablet
  @override
  double get loadingDialogHeight => 150.0; // Default loading dialog height for tablet
  @override
  double get loadingDialogWidth => 200.0; // Default loading dialog width for tablet
  @override
  double get verificationItemSize => 120.0; // Default size for verification items on tablet

  @override
  double get sBackgroundHomeH => 320.0;

  @override
  double get sImageProfile => 60.0;

  @override
  double get sMyLevelContainerHomeH => 45;

  @override
  double get splashLogo => 147;
  @override
  double get pickYourPhoto => 157;

  @override
  double get sStaticHeader => 45.0;

  @override
  double get sChangeGradeH => 45.0;

  @override
  double get cupHome => 24.0;

  @override
  double get circleProgress => 35.0;
  @override
  double get imageCarouselH => 190.0;
  @override
  double get imageCarouselW => 555.0;
  @override
  double get subjectsHomePrimaryH => 180.0;
  @override
  double get subjectsHomePrimaryW => 267.0;
  @override
  double get subjectsHomeH => 111.0;
  @override
  double get subjectsHomeW => 245.0;

  @override
  double get addTaskButtonH => 70.0;

  @override
  double get addTaskH => 80.0;

  @override
  double get taskWidgetH => 85.0;

  @override
  double get moreOptionHomeR => 60.0;

  @override
  double get childWidgetForParentH => 175;

  @override
  double get progressLessonWidgetH => 25;
  @override
  double get progressLessonWidgetW => 445;

  @override
  double get iconSizeS48 => 75;

  @override
  double get buttonWidth => 500.0;

  @override
  double get s100 => 130.0;

  @override
  double get cartH => 200;

  @override
  double get cartW => 500;
}
