import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:flutter/material.dart';

import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/shared_widget/custom_inkwell.dart';

class ImagePickerSheet extends StatelessWidget {
  const ImagePickerSheet({super.key, required this.onPickType});

  final Function(ImageSourceType) onPickType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.buttonWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacing.spaceHS10,
          CustomInkWell(
            onTap: () {
              Navigator.pop(context);
              onPickType(ImageSourceType.gallery);
            },
            child: Row(
              children: [
                const Icon(Icons.photo_library),
                Spacing.spaceSW10,
                const Text(AppStrings.gallery),
              ],
            ),
          ),
          Spacing.spaceHS10,
          CustomInkWell(
            onTap: () {
              Navigator.pop(context);
              onPickType(ImageSourceType.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera),
                Spacing.spaceSW10,
                const Text(AppStrings.camera),
              ],
            ),
          ),
          Spacing.spaceHS10,
        ],
      ).paddingBody(),
    );
  }
}
