import 'package:flutter/material.dart';

import 'responsive_manager.dart';

/// Extensions for responsive values
extension ResponsiveNum on num {
  double get w => ResponsiveManager.w(toDouble());
  double get h => ResponsiveManager.h(toDouble());
  double get f => ResponsiveManager.f(toDouble());
  double get r => ResponsiveManager.r(toDouble());
}

extension ResponsivePadding on Widget {
  Widget paddingBody({double horizontal = 16.0, double vertical = 12.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      ),
      child: this,
    );
  }
}
