import 'package:ecommerce_app/core/theme_manager/models/semantic_colors.dart';
import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final SemanticColors semantic;

  const AppColorsTheme({required this.semantic});

  @override
  AppColorsTheme copyWith({SemanticColors? semantic}) {
    return AppColorsTheme(semantic: semantic ?? this.semantic);
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;

    return AppColorsTheme(
      semantic: SemanticColors(
        primary0: Color.lerp(semantic.primary0, other.semantic.primary0, t)!,
        primary1: Color.lerp(semantic.primary1, other.semantic.primary1, t)!,
        primary2: Color.lerp(semantic.primary2, other.semantic.primary2, t)!,
        primary3: Color.lerp(semantic.primary3, other.semantic.primary3, t)!,
        primary4: Color.lerp(semantic.primary4, other.semantic.primary4, t)!,
        primary5: Color.lerp(semantic.primary5, other.semantic.primary5, t)!,
        primary6: Color.lerp(semantic.primary6, other.semantic.primary6, t)!,
        primary7: Color.lerp(semantic.primary7, other.semantic.primary7, t)!,
        primary8: Color.lerp(semantic.primary8, other.semantic.primary8, t)!,
        primary9: Color.lerp(semantic.primary9, other.semantic.primary9, t)!,
        green: Color.lerp(semantic.green, other.semantic.green, t)!,
        red: Color.lerp(semantic.red, other.semantic.red, t)!,
      ),
    );
  }
}
