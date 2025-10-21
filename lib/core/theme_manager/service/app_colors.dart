import 'package:ecommerce_app/core/theme_manager/extensions/app_theme_extensions.dart';
import 'package:ecommerce_app/core/theme_manager/models/semantic_colors.dart';
import 'package:flutter/material.dart';

extension AppColorExt on BuildContext {
  SemanticColors get colors =>
      Theme.of(this).extension<AppColorsTheme>()!.semantic;
}
