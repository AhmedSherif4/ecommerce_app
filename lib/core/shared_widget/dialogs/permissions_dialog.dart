import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/buttons/button_widget.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';

showPermissionsDialog({
  required BuildContext context,
  required String title,
  required String message,
  required void Function() buttonOnPressed1,
  required void Function() buttonOnPressed2,
  required String buttonText1,
  required String buttonText2,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => PermissionsDialog(
      title: title,
      message: message,
      buttonOnPressed1: buttonOnPressed1,
      buttonOnPressed2: buttonOnPressed2,
      buttonText1: buttonText1,
      buttonText2: buttonText2,
    ),
  );
}

class PermissionsDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback buttonOnPressed1;
  final VoidCallback buttonOnPressed2;
  final String buttonText1;
  final String buttonText2;

  const PermissionsDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonOnPressed1,
    required this.buttonOnPressed2,
    required this.buttonText1,
    required this.buttonText2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: AppReference.isPortrait(context)
            ? AppReference.deviceHeight(context) * 0.4
            : AppReference.deviceHeight(context) * 0.3,
        width: AppReference.isPortrait(context)
            ? AppReference.deviceWidth(context) * 0.85
            : AppReference.deviceWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: context.colors.primary5,
          border: Border.all(color: context.colors.primary7, width: 2.w),
          borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(AppConstants.appBorderRadiusR20),
            // topRight: Radius.circular(AppConstants.appBorderRadiusR20),
            // bottomLeft: Radius.circular(AppConstants.appBorderRadiusR20),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Column(
              children: [
                Spacing.spaceHS24,
                Text(title, style: context.typography.titleMedium),
                const Divider(endIndent: 100, indent: 100),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    message,
                    style: context.typography.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: constrains.maxHeight * .2,
                  width: constrains.maxWidth * .9,
                  child: DefaultButtonWidget(
                    label: buttonText1,
                    onPressed: buttonOnPressed1,
                  ),
                ),
                Spacing.spaceHS24,
              ],
            );
          },
        ),
      ),
    );
  }
}
