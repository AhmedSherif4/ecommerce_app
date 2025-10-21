import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/route_manager.dart';
import '../custom_inkwell.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? backTo;
  const CustomBackButton({super.key, this.backTo});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap:
          backTo ??
          () {
            RouteManager.rPopRoute(context);
          },
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Icon(
          Icons.arrow_forward_ios,
          color: context.colors.primary4,
          // size: 16.h,
          weight: Spacing.iconSizeS24,
        ),
      ),
    );
  }
}
