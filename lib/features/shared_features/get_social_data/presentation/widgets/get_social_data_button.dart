import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/resources/app_constants.dart';
import '../../../../../config/resources/app_strings.dart';
import '../../../../../my_app/app_reference.dart';

class GoogleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final double widthRatioForTablet;

  const GoogleButton({
    super.key,
    required this.backgroundColor,
    required this.onTap,
    this.textColor = Colors.white,
    this.widthRatioForTablet = 0.25,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppReference.deviceIsTablet
            ? AppReference.deviceHeight(context) * 0.045.h
            : AppReference.deviceHeight(context) * 0.06,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.screenPaddingP10,
          vertical: AppPadding.screenPaddingP10,
        ),
        width: AppReference.deviceIsTablet
            ? AppReference.deviceWidth(context) * widthRatioForTablet
            : double.infinity,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.appBorderRadiusR20,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.google,
              // style: const AppTextStyle()
              //     .w500
              //     .bodySmall12
              //     .copyWith(color: textColor),
            ),
            //  SvgPicture.asset(
            // //   AppIconsAssets.sGoogleLogo,
            //  ),
          ],
        ),
      ),
    );
  }
}
