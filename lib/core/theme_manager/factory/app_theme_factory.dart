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
        floatingLabelBehavior: FloatingLabelBehavior.auto,

        filled: true,
        fillColor: colors.primary0, // الخلفية الافتراضية للفيلد
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        // ✨ النص الداخلي (hint)
        hintStyle: styles.titleMedium.copyWith(
          color: colors.primary4.withValues(alpha: 0.7),
          fontWeight: MobileAppFontWeightsConfig().regular,
        ),

        // ✨ النص الخارجي (label)
        labelStyle: styles.titleMedium.copyWith(
          color: colors.primary5,
          fontWeight: FontWeight.w500,
        ),

        // ✨ النص في حالة error
        errorStyle: styles.bodyMedium.copyWith(
          color: colors.red.withValues(alpha: 0.9),
          fontWeight: FontWeight.w500,
        ),

        // ✨ شكل الإطار في الحالات المختلفة
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colors.primary4.withValues(alpha: 0.3),
            width: 1.2,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colors.primary9, width: 1.6),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colors.primary4.withValues(alpha: 0.15),
            width: 1.2,
          ),
        ),

        // ❌ في حالة الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colors.red.withValues(alpha: 0.8),
            width: 1.3,
          ),
        ),

        // ❌ في حالة الخطأ مع focus
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: colors.red.withValues(alpha: 0.9),
            width: 1.6,
          ),
        ),

        // ✨ إضافي: ظل بسيط (soft shadow)
        constraints: BoxConstraints(minHeight: Spacing.s50),
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
      dividerColor: Colors.transparent, // ده اللي بيشيل الخط من الاكستنشن ويجت
    );
  }
}
