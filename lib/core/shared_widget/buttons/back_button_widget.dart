import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/custom_inkwell.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Function()? backTo;
  const BackButtonWidget({super.key, this.backTo});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap:
          backTo ??
          () {
            RouteManager.rPopRoute(context);
          },
      child: Icon(
        Icons.arrow_forward_ios,
        color: context.colors.primary9,
        size: Spacing.iconSizeS20,
      ),
    );
  }
}
