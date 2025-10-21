import 'package:flutter/material.dart';

class SemanticTextStyles {
  ///header1 - 64 - semiBold
  final TextStyle displayLarge;

  ///header2 - 32 - semiBold
  final TextStyle displayMedium;
  // ========== Headlines ==========
  ///header3 - 24 - semiBold
  final TextStyle headlineLarge;

  ///header4 - 20 - medium default
  final TextStyle headlineMedium;
  // ========== Titles ==========
  ///body1 - 16 - semiBold
  final TextStyle titleLarge;

  ///body1 - 16 - medium default

  final TextStyle titleMedium;
  // ========== Body Text ==========
  ///body2 - 14 - semiBold
  final TextStyle bodyLarge;

  ///body2 - 14 - medium
  final TextStyle bodyMedium;

  ///body2 - 14 - regular
  final TextStyle bodySmall;
  // ========== Labels ==========
  ///body3 - 12 - semiBold
  final TextStyle labelLarge;

  ///body3 - 12 - medium
  final TextStyle caption;

  const SemanticTextStyles({
    required this.displayLarge,
    required this.displayMedium,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.titleLarge,
    required this.titleMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.caption,
  });
}
