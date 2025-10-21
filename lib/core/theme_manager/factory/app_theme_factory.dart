import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/text_styling/factory/i_typography_factory.dart';
import 'package:ecommerce_app/core/text_styling/factory/typography_factory_provider.dart';
import 'package:ecommerce_app/core/text_styling/semantics/semantic_text_styles.dart';
import 'package:ecommerce_app/core/text_styling/tokens/app_font_weights.dart';
import 'package:ecommerce_app/core/theme_manager/extensions/app_theme_extensions.dart';
import 'package:ecommerce_app/core/theme_manager/models/semantic_colors.dart';
import 'package:ecommerce_app/core/theme_manager/tokens/colors_tokens.dart';
import 'package:flutter/material.dart';

abstract class IAppThemeFactory {
  ThemeData buildTheme({required bool isDark, required BuildContext context});
}

class AppThemeFactory implements IAppThemeFactory {
  @override
  ThemeData buildTheme({required bool isDark, required BuildContext context}) {
    final semantic = isDark ? _darkSemantic() : _lightSemantic();
    final ITypographyFactory typographyFactory =
        TypographyFactoryProvider.getFactory(semantic);
    final SemanticTextStyles styles = typographyFactory.createTextStyles();

    return _themeFromSemantic(
      colors: semantic,
      isDark: isDark,
      textConfig: typographyFactory,
      styles: styles,
    );
  }

  /// 🎨 Light Mode using ColorTokensLight
  /// ☀️ Light Mode using ColorTokensLight
  SemanticColors _lightSemantic() {
    return const SemanticColors(
      primary0: ColorTokensLight.primary0,
      primary1: ColorTokensLight.primary1,
      primary2: ColorTokensLight.primary2,
      primary3: ColorTokensLight.primary3,
      primary4: ColorTokensLight.primary4,
      primary5: ColorTokensLight.primary5,
      primary6: ColorTokensLight.primary6,
      primary7: ColorTokensLight.primary7,
      primary8: ColorTokensLight.primary8,
      primary9: ColorTokensLight.primary9,
      green: ColorTokensLight.green,
      red: ColorTokensLight.red,
    );
  }

  /// 🌙 Dark Mode using ColorTokensDark
  SemanticColors _darkSemantic() {
    return const SemanticColors(
      primary0: ColorTokensDark.primary0,
      primary1: ColorTokensDark.primary1,
      primary2: ColorTokensDark.primary2,
      primary3: ColorTokensDark.primary3,
      primary4: ColorTokensDark.primary4,
      primary5: ColorTokensDark.primary5,
      primary6: ColorTokensDark.primary6,
      primary7: ColorTokensDark.primary7,
      primary8: ColorTokensDark.primary8,
      primary9: ColorTokensDark.primary9,
      green: ColorTokensDark.green,
      red: ColorTokensDark.red,
    );
  }

  ThemeData _themeFromSemantic({
    required SemanticColors colors,
    required bool isDark,
    required ITypographyFactory textConfig,
    required SemanticTextStyles styles,
  }) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: colors.primary0,
      scaffoldBackgroundColor: colors.primary0,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary0,
        onPrimary: colors.primary9,
        secondary: colors.primary0,
        onSecondary: colors.primary9,
        error: colors.red,
        onError: colors.red,
        surface: colors.primary0,
        onSurface: colors.primary9,
      ),
      textTheme: TextTheme(
        displayLarge: styles.displayLarge,
        displayMedium: styles.displayMedium,
        titleLarge: styles.titleLarge,
        titleMedium: styles.titleMedium,
        headlineLarge: styles.headlineLarge,
        headlineMedium: styles.headlineMedium,
        labelLarge: styles.labelLarge,
        labelMedium: styles.caption,
        bodyLarge: styles.bodyLarge,
        bodyMedium: styles.bodyMedium,
        bodySmall: styles.bodySmall,
      ),

      inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(AppPadding.screenPaddingP10),
        // hint style
        hintStyle: styles.titleMedium.copyWith(
          color: colors.primary4,
          fontWeight: MobileAppFontWeightsConfig().regular,
        ),
        labelStyle: styles.titleMedium,
        // focused hint style
        counterStyle: styles.titleMedium.copyWith(
          color: colors.primary4.withValues(alpha: 0.5),
        ),
        //error style
        errorStyle: styles.bodyMedium.copyWith(color: colors.red),
        constraints: BoxConstraints(
          minHeight: Spacing.s50,
          maxHeight: Spacing.s50,
        ),
        helperMaxLines: 2,
        errorMaxLines: 2,

        fillColor: colors.primary0,
        filled: true,
        activeIndicatorBorder: BorderSide(
          color: colors.primary4,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: AppBorders.appBorderWidthR1,
          style: BorderStyle.solid,
        ),
        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary4.withValues(alpha: 0.5),
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary9,
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary4.withValues(alpha: 0.5),
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary4.withValues(alpha: 0.5),
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),

        // error border style
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.red,
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),

        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            color: colors.red,
            width: AppBorders.appBorderWidthR1,
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary9,
          foregroundColor: colors.primary0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      extensions: [
        AppColorsTheme(semantic: colors),
        AppTextTheme(styles: textConfig.createTextStyles()),
      ],
    );
  }
}
