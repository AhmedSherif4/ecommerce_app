import 'package:ecommerce_app/core/theme_manager/models/semantic_colors.dart';

import '../semantics/semantic_text_styles.dart';
import '../tokens/app_font_sizes.dart';
import '../tokens/app_font_weights.dart';
import '../tokens/app_letter_spacings.dart';
import '../tokens/app_line_heights.dart';
import '../tokens/typography_tokens.dart';
import 'i_typography_factory.dart';

class MobileTypographyFactory implements ITypographyFactory {
  final SemanticColors colors;

  MobileTypographyFactory({required this.colors});

  @override
  SemanticTextStyles createTextStyles() {
    final tokens = TypographyTokens(
      fontSizes: MobileAppFontSizesConfig(),
      fontWeights: MobileAppFontWeightsConfig(),
      letterSpacings: MobileAppLetterSpacingsConfig(),
      lineHeights: MobileAppLineHeightsConfig(),
      color: colors,
    );

    return SemanticTextStyles(
      displayLarge: tokens.displayLarge,
      displayMedium: tokens.displayMedium,
      headlineLarge: tokens.headlineLarge,
      headlineMedium: tokens.headlineMedium,
      titleLarge: tokens.titleLarge,
      titleMedium: tokens.titleMedium,
      bodyLarge: tokens.bodyLarge,
      bodyMedium: tokens.bodyMedium,
      bodySmall: tokens.bodySmall,
      labelLarge: tokens.labelLarge,
      caption: tokens.caption,
    );
  }
}
