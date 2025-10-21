import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppShadow {
  static const BoxShadow outerShadow = BoxShadow(
    color: Colors.grey,
    offset: Offset(4.0, 4.0),
    blurRadius: 8.0,
    spreadRadius: 1.0,
  );

  static BoxShadow appBoxShadow(BuildContext context) => BoxShadow(
    color: context.colors.primary3.withOpacity(0.08),
    spreadRadius: 2,
    blurRadius: 2,
    offset: const Offset(0, 2), // changes position of shadow
  );

  static BoxShadow filledBoxShadow(BuildContext context) => BoxShadow(
    offset: const Offset(0, 10),
    blurRadius: 33,
    color: context.colors.primary3.withOpacity(0.08),
  );

  static BoxShadow newFilledBoxShadow(BuildContext context) => BoxShadow(
    color: context.colors.primary3.withOpacity(0.08),
    offset: const Offset(0, 4),
    blurRadius: 15,
    spreadRadius: 0,
  );
}
