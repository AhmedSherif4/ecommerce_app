import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/shared_widget/custom_inkwell.dart';
import '../../app_assets/app_assets.dart';
import '../../core/responsive_manager/app_padding.dart';
import '../../my_app/app_reference.dart';

class HeaderForMore extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backButtonColor;
  final bool notFirst;
  final bool haveIcon;
  final Function()? onBack;

  const HeaderForMore({
    required this.title,
    this.textColor = Colors.black,
    this.backButtonColor = Colors.orange,
    super.key,
    this.notFirst = true,
    this.haveIcon = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (AppReference.deviceIsTablet && !AppReference.isPortrait(context))
          ? AppReference.deviceWidth(context) * 0.04
          : AppReference.deviceHeight(context) * 0.08,
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                Assets.imagesLogoWithoutName,
                width: constrains.maxWidth * 0.15,
                height: constrains.maxHeight * 0.6,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                // style: const AppTextStyle()
                //     .w500
                //     .bodyLarge16
                //     .copyWith(
                //     fontSize: 16,
                //     color: textColor),
              ),
              if (haveIcon)
                SvgPicture.asset(Assets.imagesMyTime, fit: BoxFit.contain),
              switch (notFirst) {
                true => CustomInkWell(
                  onTap:
                      onBack ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    height: constrains.maxHeight,
                    padding: EdgeInsetsDirectional.all(
                      AppPadding.screenPaddingP10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.back,
                          // style: const AppTextStyle().balooBhaijaan2.w700.bodyMedium14.copyWith(
                          //     fontSize: AppFontSize.sp14.responsiveFontSize,
                          //     color: backButtonColor),
                        ),
                        Spacing.spaceSW5,
                        //SvgPicture.asset(AppIconsAssets.sExit,colorFilter:  ColorFilter.mode(backButtonColor, BlendMode.srcIn),)
                        Icon(
                          Icons.arrow_forward_ios,
                          color: backButtonColor,
                          size: 16,
                        ),
                      ],
                    ),

                    // SvgPicture.asset(
                    //   AppIconsAssets.sOrangeBack,
                    //   width: constrains.maxWidth * 0.1,
                    //   height: constrains.maxHeight * 0.3,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                false => SizedBox(width: constrains.maxWidth * 0.1),
              },
            ],
          );
        },
      ),
    );
  }
}
