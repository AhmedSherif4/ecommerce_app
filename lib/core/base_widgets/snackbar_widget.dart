import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';

import '../enum/enum_generation.dart';

void showSnackBar({
  required String description,
  required ToastStates state,
  double? bottomPadding,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    _messageSnackBar(
      description: description,
      bottomPadding: bottomPadding,
      state: state,
      context: context,
    ),
  );
}

void showSnackBarWithAction({
  required String description,
  required ToastStates state,
  required BuildContext context,
  required IconData actionIcon,
  required String actionLabel,
  required VoidCallback onPressed,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    _messageSnackBarWithAction(
      description: description,
      state: state,
      context: context,
      actionIcon: actionIcon,
      actionLabel: actionLabel,
      onPressed: onPressed,
    ),
  );
}

SnackBar _messageSnackBarWithAction({
  required String description,
  required ToastStates state,
  required BuildContext context,
  required IconData actionIcon,
  required String actionLabel,
  required VoidCallback onPressed,
}) {
  return SnackBar(
    content: Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppPadding.screenPaddingP10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppBorders.appBorderWidthR15),
        ),
        color: _chooseToastPrimaryColor(state),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: context.typography.titleLarge.copyWith(color: Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton.icon(
              onPressed: onPressed,
              icon: Icon(actionIcon, color: Colors.white),
              label: Text(
                actionLabel,
                style: context.typography.bodyLarge.copyWith(
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: const Duration(seconds: 2),
  );
}

SnackBar _messageSnackBar({
  required String description,
  required ToastStates state,
  double? bottomPadding,
  required BuildContext context,
}) {
  return SnackBar(
    content: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: _chooseToastPrimaryColor(state),
      ),
      child: Text(
        description,
        style: context.typography.bodyMedium.copyWith(color: Colors.white),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsetsDirectional.only(bottom: bottomPadding ?? 0),
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: const Duration(seconds: 2),
  );
}

Color _chooseToastPrimaryColor(ToastStates state) {
  switch (state) {
    case ToastStates.congrats:
      return const Color(0xFF2D6A4F);
    case ToastStates.error:
      return const Color(0xFFC72C41);
    case ToastStates.warning:
      return const Color(0xFFFCA652);
    case ToastStates.info:
      return const Color(0xFF3282B8);
  }
}
