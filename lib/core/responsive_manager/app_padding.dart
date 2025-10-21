import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_manager.dart';

/// General page paddings and sizes
class AppPadding {
  static double get screenPaddingP24 {
    final sPadding = ResponsiveManager.deviceType == DeviceType.tablet
        ? 30.r
        : 24.r;
    return sPadding;
  }

  static double get screenPaddingP10 {
    final sPadding = ResponsiveManager.deviceType == DeviceType.tablet
        ? 20.r
        : 10.r;
    return sPadding;
  }

  static double get p20 {
    return ResponsiveManager.deviceType == DeviceType.tablet ? 30.r : 20.r;
  }
}
