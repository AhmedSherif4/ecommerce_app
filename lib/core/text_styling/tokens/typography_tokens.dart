import 'package:flutter/material.dart';

import '../../theme_manager/models/semantic_colors.dart';
import 'app_font_families.dart';
import 'app_font_sizes.dart';
import 'app_font_weights.dart';
import 'app_letter_spacings.dart';
import 'app_line_heights.dart';

class TypographyTokens {
  TypographyTokens({
    required this.fontSizes,
    required this.fontWeights,
    required this.letterSpacings,
    required this.lineHeights,
    required this.color,
  });

  final IAppFontSizesConfig fontSizes;
  final IAppFontWeightsConfig fontWeights;
  final IAppLetterSpacingsConfig letterSpacings;
  final IAppLineHeightsConfig lineHeights;
  final SemanticColors color;

  // ========== Display ==========
  TextStyle get displayLarge => TextStyle(
    fontSize: fontSizes.displayLarge,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.displayLarge,
    letterSpacing: letterSpacings.displayLarge,
    color: color.primary9,
  );

  TextStyle get displayMedium => TextStyle(
    fontSize: fontSizes.displayMedium,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.displayMedium,
    letterSpacing: letterSpacings.displayMedium,
    color: color.primary9,
  );

  // ========== Headlines ==========
  TextStyle get headlineLarge => TextStyle(
    fontSize: fontSizes.headlineLarge,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.headlineLarge,
    letterSpacing: letterSpacings.headlineLarge,
    color: color.primary9,
  );

  TextStyle get headlineMedium => TextStyle(
    fontSize: fontSizes.headlineMedium,
    fontWeight: fontWeights.medium,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.headlineMedium,
    letterSpacing: letterSpacings.headlineMedium,
    color: color.primary9,
  );

  // ========== Titles ==========
  TextStyle get titleLarge => TextStyle(
    fontSize: fontSizes.titleLarge,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.titleLarge,
    letterSpacing: letterSpacings.titleLarge,
    color: color.primary9,
  );

  TextStyle get titleMedium => TextStyle(
    fontSize: fontSizes.titleMedium,
    fontWeight: fontWeights.medium,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.titleMedium,
    letterSpacing: letterSpacings.titleMedium,
    color: color.primary9,
  );

  // ========== Body ==========
  TextStyle get bodyLarge => TextStyle(
    fontSize: fontSizes.bodyLarge,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.bodyLarge,
    letterSpacing: letterSpacings.bodyLarge,
    color: color.primary9,
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: fontSizes.bodyMedium,
    fontWeight: fontWeights.medium,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.bodyMedium,
    letterSpacing: letterSpacings.bodyMedium,
    color: color.primary9,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: fontSizes.bodySmall,
    fontWeight: fontWeights.regular,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.bodySmall,
    letterSpacing: letterSpacings.bodySmall,
    color: color.primary9,
  );

  // ========== Labels ==========
  TextStyle get labelLarge => TextStyle(
    fontSize: fontSizes.labelLarge,
    fontWeight: fontWeights.semiBold,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.labelLarge,
    letterSpacing: letterSpacings.labelLarge,
    color: color.primary9,
  );

  // ========== Caption ==========
  TextStyle get caption => TextStyle(
    fontSize: fontSizes.caption,
    fontWeight: fontWeights.medium,
    fontFamily: AppFontFamilies.primary,
    height: lineHeights.caption,
    letterSpacing: letterSpacings.caption,
    color: color.primary9,
  );
}
