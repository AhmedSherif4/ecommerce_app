import 'dart:math';

import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widget/custom_inkwell.dart';
import '../../my_app/app_reference.dart';

class HeaderForMore extends StatelessWidget {
  final String title;
  final String? logoSvg;
  final bool hasLogo;
  final bool hasBack;
  final Function()? onBack;
  final Function()? logoOnPress;

  const HeaderForMore({
    super.key,
    required this.title,
    this.logoSvg,
    this.hasLogo = false,
    this.logoOnPress,
    this.hasBack = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (AppReference.deviceIsTablet && !AppReference.isPortrait(context))
          ? AppReference.deviceWidth(context) * 0.04
          : AppReference.deviceWidth(context) * 0.08,
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasBack)
                CustomInkWell(
                  onTap:
                      onBack ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: context.colors.primary9,
                    size: min(
                      constrains.maxWidth * 0.1,
                      constrains.maxHeight * 0.6,
                    ),
                  ),
                ),
              const Spacer(),
              Text(title, style: context.typography.titleLarge),
              const Spacer(),
              if (hasLogo)
                InkWell(
                  onTap: logoOnPress,

                  child: SvgPicture.asset(
                    logoSvg!,
                    width: constrains.maxWidth * 0.15,
                    height: constrains.maxHeight * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
