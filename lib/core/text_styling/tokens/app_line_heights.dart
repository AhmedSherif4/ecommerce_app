abstract class IAppLineHeightsConfig {
  double get displayLarge;
  double get displayMedium;
  double get headlineLarge;
  double get headlineMedium;
  double get titleLarge;
  double get titleMedium;
  double get bodyLarge;
  double get bodyMedium;
  double get bodySmall;
  double get labelLarge;
  double get caption;
}

class MobileAppLineHeightsConfig implements IAppLineHeightsConfig {
  @override
  double get displayLarge => 1.2;
  @override
  double get displayMedium => 1.25;
  @override
  double get headlineLarge => 1.5;
  @override
  double get headlineMedium => 1.35;
  @override
  double get titleLarge => 1.4;
  @override
  double get titleMedium => 1.5;
  @override
  double get bodyLarge => 1.5;
  @override
  double get bodyMedium => 1.5;
  @override
  double get bodySmall => 1.5;
  @override
  double get labelLarge => 1.4;
  @override
  double get caption => 1.6;
}

class TabletAppLineHeightsConfig implements IAppLineHeightsConfig {
  @override
  double get displayLarge => 1.2;
  @override
  double get displayMedium => 1.25;
  @override
  double get headlineLarge => 1.3;
  @override
  double get headlineMedium => 1.35;
  @override
  double get titleLarge => 1.4;
  @override
  double get titleMedium => 1.5;
  @override
  double get bodyLarge => 1.5;
  @override
  double get bodyMedium => 1.5;
  @override
  double get bodySmall => 1.5;
  @override
  double get labelLarge => 1.4;
  @override
  double get caption => 1.6;
}
