import 'package:flutter/material.dart';

abstract class IAppFontWeightsConfig {
  FontWeight get bold;
  FontWeight get semiBold;
  FontWeight get medium;
  FontWeight get regular;
}

class MobileAppFontWeightsConfig implements IAppFontWeightsConfig {
  @override
  FontWeight get bold => FontWeight.w700;
  @override
  FontWeight get semiBold => FontWeight.w600;
  @override
  FontWeight get medium => FontWeight.w500;
  @override
  FontWeight get regular => FontWeight.w400;
}

// نفس القيم للـ Tablet
class TabletAppFontWeightsConfig implements IAppFontWeightsConfig {
  @override
  FontWeight get bold => FontWeight.w700;
  @override
  FontWeight get semiBold => FontWeight.w600;
  @override
  FontWeight get medium => FontWeight.w500;
  @override
  FontWeight get regular => FontWeight.w400;
}
