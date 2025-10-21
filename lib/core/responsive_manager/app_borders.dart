import 'package:ecommerce_app/core/responsive_manager/responsive_manager.dart';
import 'package:flutter/material.dart';

class AppBorders {
  static BorderRadius get appRadiusR12 {
    final radius = ResponsiveManager.deviceType == DeviceType.tablet
        ? 16.0
        : 12.0;
    return BorderRadius.circular(radius);
  }

  static double get appBorderWidthR15 {
    return ResponsiveManager.deviceType == DeviceType.tablet ? 22.5 : 15.0;
  }

  static double get appBorderWidthR7 {
    return ResponsiveManager.deviceType == DeviceType.tablet ? 8 : 15.0;
  }

  static double get appBorderWidthR1 {
    return ResponsiveManager.deviceType == DeviceType.tablet ? 1 : 1.7;
  }

  static double get appRadiusR40 {
    return 40;
  }

  static double get appBorderWidthR30 {
    return ResponsiveManager.deviceType == DeviceType.tablet ? 45.0 : 30.0;
  }
}
