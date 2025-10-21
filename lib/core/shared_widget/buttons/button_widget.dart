import 'package:ecommerce_app/config/resources/app_animations.dart';
import 'package:ecommerce_app/config/resources/app_constants.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../responsive_manager/spacing_facade.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final bool isExpanded;
  final String label;
  final Function() onPressed;
  final double? width;
  final double? height;
  final double frontIconSize;
  final double iconSize;
  final Color? borderColor;
  final double textVerticalPadding;
  final double textHorizontalPadding;
  final TextStyle? textStyle;
  final String? icon;
  final String? frontIcon;
  final double? elevation;
  final Color? textColor;
  const DefaultButtonWidget({
    super.key,
    this.buttonColor,
    this.isExpanded = false,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.frontIconSize = AppConstants.iconSizeS20,
    this.iconSize = AppConstants.iconSizeS20,

    this.borderColor,
    this.textVerticalPadding = 10,
    this.textHorizontalPadding = 16,
    this.textStyle,
    this.icon,
    this.frontIcon,
    this.elevation,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor ?? context.colors.primary9,
      elevation: elevation,
      minWidth: isExpanded ? double.infinity : width,
      height: height ?? Spacing.buttonHeight,
      padding: EdgeInsetsDirectional.symmetric(
        vertical: textVerticalPadding,
        horizontal: textHorizontalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR10),
        side: BorderSide(color: borderColor ?? context.colors.primary2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (frontIcon != null) ...[
            SvgPicture.asset(
              frontIcon!,
              height: frontIconSize,
              width: frontIconSize,
            ),
            Spacing.spaceSW10,
          ],
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style:
                textStyle ??
                context.typography.titleMedium.copyWith(
                  color: textColor ?? context.colors.primary0,
                ),
          ),
          if (icon != null) ...[
            Spacing.spaceSW32,
            SvgPicture.asset(icon!, height: iconSize, width: iconSize),
          ],
        ],
      ),
    ).animateShimmer();
  }
}
