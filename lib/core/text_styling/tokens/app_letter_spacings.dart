abstract class IAppLetterSpacingsConfig {
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

class MobileAppLetterSpacingsConfig implements IAppLetterSpacingsConfig {
  @override
  double get displayLarge => -0.015;
  @override
  double get displayMedium => -0.01;
  @override
  double get headlineLarge => 0.0;
  @override
  double get headlineMedium => 0.005;
  @override
  double get titleLarge => 0.01;
  @override
  double get titleMedium => 0.015;
  @override
  double get bodyLarge => 0.025;
  @override
  double get bodyMedium => 0.025;
  @override
  double get bodySmall => 0.035;
  @override
  double get labelLarge => 0.01;
  @override
  double get caption => 0.04;
}

// Tablet نفس القيم
class TabletAppLetterSpacingsConfig implements IAppLetterSpacingsConfig {
  @override
  double get displayLarge => -0.015;
  @override
  double get displayMedium => -0.01;
  @override
  double get headlineLarge => 0.0;
  @override
  double get headlineMedium => 0.005;
  @override
  double get titleLarge => 0.01;
  @override
  double get titleMedium => 0.015;
  @override
  double get bodyLarge => 0.025;
  @override
  double get bodyMedium => 0.025;
  @override
  double get bodySmall => 0.035;
  @override
  double get labelLarge => 0.01;
  @override
  double get caption => 0.04;
}
