import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../config/resources/app_constants.dart';
import '../../../../../../../config/routes/route_manager.dart';
import '../../../../../../../core/responsive_manager/app_padding.dart';
import '../../../../../../../core/responsive_manager/spacing_facade.dart';
import '../../../../../../../core/shared_widget/custom_inkwell.dart';
import '../../../../../../../my_app/app_reference.dart';
import '../../../edit_profile.dart';

class ListTileUpdateUserDataWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool withEdit;
  final bool withAdd;

  const ListTileUpdateUserDataWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.withEdit = false,
    this.withAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppReference.deviceHeight(context) * 0.06.h,
            width: AppReference.deviceWidth(context),
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.screenPaddingP10,
            ),
            decoration: BoxDecoration(
              color: context.colors.primary0,
              borderRadius: BorderRadius.circular(
                AppConstants.appBorderRadiusR20,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Row(
                  children: [
                    Container(
                      height:
                          ((AppReference.deviceIsTablet &&
                              !AppReference.isPortrait(context)))
                          ? constrains.maxHeight
                          : constrains.maxHeight * 0.7,
                      width: constrains.maxWidth * 0.2,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(
                        ((AppReference.deviceIsTablet &&
                                !AppReference.isPortrait(context)))
                            ? 0
                            : AppPadding.screenPaddingP10,
                      ),
                      decoration: ShapeDecoration(
                        color: context.colors.primary1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.appBorderRadiusR20,
                          ),
                        ),
                      ),
                      child: FittedBox(
                        child: Text(
                          title,
                          style: context.typography.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(width: constrains.maxWidth * 0.04),
                    SizedBox(
                      width: constrains.maxWidth * 0.4,
                      child: Text(
                        subtitle,
                        style: context.typography.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Spacing.spaceSW5,
        if (withEdit)
          CustomInkWell(
            onTap: () {
              RouteManager.rPushNamed(
                context: context,
                rName: AppRoutesNames.rEditProfileScreen,
                arguments: DataToGoToEditProfileScreen(
                  title: title,
                  oldData: subtitle,
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(AppPadding.screenPaddingP10),
              decoration: ShapeDecoration(
                color: context.colors.primary2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.appBorderRadiusR20,
                  ),
                ),
              ),
              child: Text(
                withAdd ? "Add" : 'Edit',
                style: context.typography.bodySmall.copyWith(
                  color: context.colors.primary0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
