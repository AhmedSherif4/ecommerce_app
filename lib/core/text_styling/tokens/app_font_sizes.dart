abstract class IAppFontSizesConfig {
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

class MobileAppFontSizesConfig implements IAppFontSizesConfig {
  @override
  double get displayLarge => 64; // Display Large h1
  @override
  double get displayMedium => 32; // Display Medium h2
  @override
  double get headlineLarge => 24; // Headline Large h3
  @override
  double get headlineMedium => 20; // Headline Medium h4
  @override
  double get titleLarge => 16; // Title Large h5
  @override
  double get titleMedium => 16; // Title Medium h6
  @override
  double get bodyLarge => 14; // Body Large
  @override
  double get bodyMedium => 14; // Body Medium
  @override
  double get bodySmall => 14; // Body Small
  @override
  double get labelLarge => 12; // Label Large (Button)
  @override
  double get caption => 12; // Caption
}

class TabletAppFontSizesConfig implements IAppFontSizesConfig {
  @override
  double get displayLarge => 72;
  @override
  double get displayMedium => 54;
  @override
  double get headlineLarge => 40.5;
  @override
  double get headlineMedium => 36;
  @override
  double get titleLarge => 31.5;
  @override
  double get titleMedium => 27;
  @override
  double get bodyLarge => 20.25;
  @override
  double get bodyMedium => 18;
  @override
  double get bodySmall => 15.75;
  @override
  double get labelLarge => 18;
  @override
  double get caption => 15.75;
}
