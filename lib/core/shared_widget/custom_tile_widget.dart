import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/custom_inkwell.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../responsive_manager/app_borders.dart';

class CustomTileWithArrowWidget extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback onTap;
  final bool isUnlink;
  const CustomTileWithArrowWidget({
    super.key,
    required this.asset,
    required this.title,
    required this.onTap,
    this.isUnlink = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
          color: isUnlink ? context.colors.red : null,
        ),
        child: Row(
          children: [
            SvgPicture.asset(asset, height: 24.h, width: 24.w),
            Spacing.spaceSW10,
            Expanded(
              child: Text(
                title,
                style: context.typography.labelLarge.copyWith(
                  color: isUnlink
                      ? context.colors.red
                      : context.colors.primary5,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isUnlink ? context.colors.red : context.colors.primary5,
            ),
          ],
        ),
      ),
    );
  }
}
