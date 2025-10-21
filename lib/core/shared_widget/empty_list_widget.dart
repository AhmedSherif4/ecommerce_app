import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_assets/app_assets.dart';
import '../../my_app/app_reference.dart';

class EmptyListWidgets extends StatelessWidget {
  final String message;
  final bool makeTextBlack;

  const EmptyListWidgets({
    super.key,
    required this.message,
    this.makeTextBlack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesEmptyList,
          height: AppReference.deviceHeight(context) * 0.12,
          width: AppReference.deviceWidth(context) * 0.5,
        ),
        Spacing.spaceHS24,
        Text(message, style: context.typography.bodyMedium),
      ],
    );
  }
}
