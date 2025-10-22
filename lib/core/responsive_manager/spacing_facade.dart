import 'package:flutter/material.dart';

import 'responsive_context.dart';
import 'responsive_extensions.dart';

/// Facade for easy spacing usage
class Spacing {
  Spacing._();

  static double get s16 => SpacingContext.instance.spacing.s16;
  static double get s100 => SpacingContext.instance.spacing.s100;
  static double get s24 => SpacingContext.instance.spacing.s24;
  static double get s32 => SpacingContext.instance.spacing.s32;
  static double get s50 => SpacingContext.instance.spacing.s50;
  static double get s10 => SpacingContext.instance.spacing.s10;
  static double get s12 => SpacingContext.instance.spacing.s12;
  static double get s5 => SpacingContext.instance.spacing.s5;
  static double get s20 => SpacingContext.instance.spacing.s20;

  static double get s8 => SpacingContext.instance.spacing.s8;
  static double get s28 => SpacingContext.instance.spacing.s28;
  static double get s44 => SpacingContext.instance.spacing.s44;

  static double get navBarH => SpacingContext.instance.spacing.navBarH.h;
  static double get cartH => SpacingContext.instance.spacing.cartH.h;
  static double get cartW => SpacingContext.instance.spacing.cartW.w;
  static double get buttonHeight =>
      SpacingContext.instance.spacing.buttonHeight.h;
  static double get buttonWidth =>
      SpacingContext.instance.spacing.buttonWidth.w;
  static double get verificationItemSize =>
      SpacingContext.instance.spacing.verificationItemSize;
  static double get s40 => SpacingContext.instance.spacing.s40;

  static double get tabBarHeight =>
      SpacingContext.instance.spacing.tabBarHeight.h;
  static double get iconSizeS20 => SpacingContext.instance.spacing.iconSizeS20;
  static double get loadingDialogHeight =>
      SpacingContext.instance.spacing.loadingDialogHeight.h;
  static double get loadingDialogWidth =>
      SpacingContext.instance.spacing.loadingDialogWidth.w;

  static double get splashLogo => SpacingContext.instance.spacing.splashLogo.w;
  static double get pickYourPhoto =>
      SpacingContext.instance.spacing.pickYourPhoto.r;

  static double get iconSizeS24 =>
      SpacingContext.instance.spacing.iconSizeS24.r;

  static SizedBox get spaceHS16 => SizedBox(height: s16.h);
  static SizedBox get spaceHS5 => SizedBox(height: s5.h);

  static SizedBox get spaceHS40 => SizedBox(height: s40.h);

  static SizedBox get spaceSW16 => SizedBox(width: s16.w);
  static SizedBox get spaceSW5 => SizedBox(width: s5.w);
  static SizedBox get spaceHS24 => SizedBox(height: s24.h);
  static SizedBox get spaceSW24 => SizedBox(width: s24.w);
  static SizedBox get spaceHS32 => SizedBox(height: s32.h);
  static SizedBox get spaceSW32 => SizedBox(width: s32.w);
  static SizedBox get spaceHS10 => SizedBox(height: s10.h);
  static SizedBox get spaceSW10 => SizedBox(width: s10.w);
  static SizedBox get spaceHS50 => SizedBox(height: s50.h);
  static SizedBox get spaceSW50 => SizedBox(width: s50.w);
}
