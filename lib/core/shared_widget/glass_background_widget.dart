import 'dart:ui';

import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:flutter/material.dart';

class GlassBackgroundWidget extends StatelessWidget {
  const GlassBackgroundWidget({
    super.key,
    required this.heightFromDeviceHeight,
    required this.bodyChild,
  });

  final double heightFromDeviceHeight;
  final Widget bodyChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35), // الـ Layer blur
        child: Container(
          height: heightFromDeviceHeight / 2,
          color: Colors.white.withOpacity(0.4),
          child: bodyChild,
        ),
      ),
    );
  }
}
