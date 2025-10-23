import 'dart:io';

import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/responsive_manager/spacing_facade.dart';
import '../../../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../../../core/shared_widget/nullable_network_image.dart';
import '../../../../../../../my_app/app_reference.dart';

class ImageAccountMoreWidget extends StatelessWidget {
  final bool withCamera;
  final File? imageFile;

  const ImageAccountMoreWidget({
    super.key,
    this.withCamera = false,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLocalEmpty =
        getIt<UserLocalDataSource>().getUserData()!.imgPath == null ||
        getIt<UserLocalDataSource>().getUserData()!.imgPath!.isEmpty;
    final bool isPickedEmpty = imageFile!.path == "";

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          padding: EdgeInsets.zero,
          alignment: AlignmentDirectional.center,
          height: Spacing.pickYourPhoto,
          width: Spacing.pickYourPhoto,
          decoration: ShapeDecoration(
            color: context.colors.primary0,
            shape: OvalBorder(
              side: BorderSide(width: 0.50.r, color: context.colors.primary1),
            ),
            image: !isPickedEmpty
                ? DecorationImage(image: FileImage(imageFile!))
                : null,
          ),
          child: !isPickedEmpty
              ? null
              : ClipOval(
                  child: NullableNetworkImage(
                    imagePath: getIt<UserLocalDataSource>()
                        .getUserData()!
                        .imgPath,
                    notHaveImage: isLocalEmpty,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
        ),
        if (withCamera)
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: AppReference.deviceIsTablet ? 10.r : 3.0.r,
              end: AppReference.deviceIsTablet ? 10.r : 3.0.r,
            ),
            child: Icon(
              Icons.camera_alt_rounded,
              color: context.colors.primary9,
              size: Spacing.iconSizeS24,
            ),
          ),
      ],
    );
  }
}
