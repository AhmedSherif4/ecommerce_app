import 'package:flutter/material.dart';
import '../semantics/semantic_text_styles.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final SemanticTextStyles styles;
  const AppTextTheme({required this.styles});

  @override
  AppTextTheme copyWith({SemanticTextStyles? styles}) {
    return AppTextTheme(styles: styles ?? this.styles);
  }

  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(styles: other.styles);
  }
}

extension AppTextThemeExt on BuildContext {
  SemanticTextStyles get typography {
    final themeExt = Theme.of(this).extension<AppTextTheme>();
    assert(themeExt != null, '❌ AppTextTheme not found in ThemeData');
    return themeExt!.styles;
  }
}
