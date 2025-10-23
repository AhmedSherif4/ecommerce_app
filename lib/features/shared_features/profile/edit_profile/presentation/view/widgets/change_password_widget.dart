import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../config/resources/app_constants.dart';
import '../../../../../../../config/routes/route_manager.dart';
import '../../../../../../../core/responsive_manager/app_padding.dart';
import '../../../../../../../core/responsive_manager/spacing_facade.dart';
import '../../../../../../../core/shared_widget/custom_inkwell.dart';
import '../../../../../../../my_app/app_reference.dart';

class ChangePasswordUpdateUserDataWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String routeTo;

  const ChangePasswordUpdateUserDataWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.routeTo,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        RouteManager.rPushNamed(context: context, rName: routeTo);
      },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.screenPaddingP10,
        ),
        height:
            ((AppReference.deviceIsTablet && !AppReference.isPortrait(context)))
            ? AppReference.deviceHeight(context) * 0.15
            : AppReference.deviceHeight(context) * 0.06,
        decoration: ShapeDecoration(
          color: context.colors.primary1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.appPaddingR20),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Spacing.spaceSW16,
            Text(title, style: context.typography.bodyMedium),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: context.colors.primary9),
          ],
        ),
      ),
    );
  }
}
