import 'package:ecommerce_app/config/resources/app_constants.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_manager.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../config/resources/app_strings.dart';
import '../../responsive_manager/app_padding.dart';
import '../buttons/button_widget.dart';

class DefaultAlertDialog extends StatelessWidget {
  final String message;
  final Function(bool) confirm;
  final bool isTwoButton;
  final bool withImage;
  final String? title;
  final String imagePath;

  const DefaultAlertDialog({
    super.key,
    required this.message,
    required this.confirm,
    this.isTwoButton = true,
    this.withImage = true,
    this.title,
    this.imagePath = Assets.imagesAlertDialog,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      elevation: 5,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.all(AppPadding.screenPaddingP24),
        width: ResponsiveManager.isTablet
            ? AppReference.deviceWidth(context) * 0.6
            : AppReference.deviceWidth(context) * 0.8,
        constraints: BoxConstraints(
          minWidth: AppReference.deviceIsTablet
              ? AppReference.deviceWidth(context) * 0.4
              : AppReference.deviceWidth(context) * 0.8,
          maxWidth: AppReference.deviceIsTablet
              ? AppReference.deviceWidth(context) * 0.6
              : AppReference.deviceWidth(context) * 0.8,
          minHeight: AppReference.deviceHeight(context) * 0.26,
          maxHeight: AppReference.deviceIsTablet
              ? AppReference.deviceHeight(context) * 0.45
              : AppReference.deviceHeight(context) * 0.46,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (withImage)
              SvgPicture.asset(
                imagePath,
                height: AppReference.deviceHeight(context) * 0.16,
              ),
            if (withImage)
              Text(
                title ?? AppStrings.alert,
                style: context.typography.titleMedium,
              ),
            Text(message, maxLines: 5, overflow: TextOverflow.ellipsis),
            OkOrCancelButton(confirm: (confirm), isTwoButton: isTwoButton),
          ],
        ),
      ),
    );
  }
}

class OkOrCancelButton extends StatelessWidget {
  final Function(bool) confirm;
  final bool isTwoButton;

  const OkOrCancelButton({
    super.key,
    required this.confirm,
    this.isTwoButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButtonWidget(
            label: AppStrings.ok,

            onPressed: () {
              confirm(true);
              Navigator.pop(context);
            },
          ),
        ),
        Spacing.spaceSW10,
        if (isTwoButton)
          Expanded(
            child: DefaultButtonWidget(
              label: AppStrings.cancel,

              buttonColor: context.colors.red,
              onPressed: () {
                confirm(false);
                Navigator.pop(context);
              },
            ),
          ),
      ],
    );
  }
}
