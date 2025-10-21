import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../config/resources/app_strings.dart';

class DividerOrWidget extends StatelessWidget {
  const DividerOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Divider(color: context.colors.primary2),
        CircleAvatar(
          backgroundColor: context.colors.primary0,
          child: const Text(AppStrings.or),
        ),
      ],
    );
  }
}
