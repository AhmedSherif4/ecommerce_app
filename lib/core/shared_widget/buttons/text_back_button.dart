import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';

import '../../../config/resources/app_strings.dart';
import '../../../config/routes/route_manager.dart';
import '../../responsive_manager/spacing_facade.dart';
import '../custom_inkwell.dart';
import 'text_button_widget.dart';

class TextBackButton extends StatelessWidget {
  final Function()? backTo;
  const TextBackButton({super.key, this.backTo});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap:
          backTo ??
          () {
            RouteManager.rPopRoute(context);
          },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButtonWidget(
            text: AppStrings.back,
            style: context.typography.bodyMedium,
            onPressed:
                backTo ??
                () {
                  RouteManager.rPopRoute(context);
                },
          ),
          Spacing.spaceSW10,
          const Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 16),
        ],
      ),
    );
  }
}
