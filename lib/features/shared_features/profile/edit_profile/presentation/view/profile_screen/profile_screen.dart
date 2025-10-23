import 'dart:io';

import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/enum/enum_generation.dart';
import '../../../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../../../../../../core/shared_widget/image_pick/pick_image_inkwell/pick_image_ink_well.dart';
import '../../../../../header_for_more.dart';
import '../../../edit_profile.dart';
import '../widgets/change_password_widget.dart';
import '../widgets/image_account.dart';
import '../widgets/list_tile_update_data.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  late UserEntity userData;
  File imageFile = File("");
  @override
  void didChangeDependencies() {
    userData = getIt<UserLocalDataSource>().getUserData()!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {'title': AppStrings.name, 'subtitle': userData.name, 'withEdit': true},

      {
        'title': AppStrings.email,
        'subtitle': userData.email ?? '',
        'withEdit': true,
      },
      {
        'title': AppStrings.phone,
        'subtitle': userData.phone ?? '',
        'withEdit': true,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderForMore(title: 'My Details'),
              PickImageInkWell(
                pickImageWidget: ImageAccountMoreWidget(
                  withCamera: true,
                  imageFile: imageFile,
                ),
                loadingPickImageWidget: ImageAccountMoreWidget(
                  withCamera: true,
                  imageFile: imageFile,
                ),
                loadedPickImageWidget: StatefulBuilder(
                  builder: (context, updateState) {
                    return ImageAccountMoreWidget(
                      withCamera: true,
                      imageFile: imageFile,
                    );
                  },
                ),
                errorPickImageWidget: ImageAccountMoreWidget(
                  withCamera: true,
                  imageFile: imageFile,
                ),
                pickImageShape: PickImageShape.bottomSheet,
                permissionDialogMessage: AppStrings.permissionPhotoMessage,
                onErrorMessage: (value) {},
                onPickFile: (value) {
                  imageFile = value;
                  getIt<EditProfileBloc>().add(
                    EditProfile(image: imageFile.path, withImage: true),
                  );
                },
              ),
              Spacing.spaceHS10,
              ListView.separated(
                itemBuilder: (context, index) => ListTileUpdateUserDataWidget(
                  title: data[index]['title'],
                  subtitle: data[index]['subtitle'],
                  withAdd: data[index]['subtitle'] == "",
                  withEdit: data[index]['withEdit'],
                ),
                separatorBuilder: (context, index) =>
                    Divider(color: context.colors.primary1, thickness: 1),
                itemCount: data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Spacing.spaceHS32,
              ChangePasswordUpdateUserDataWidget(
                title: AppStrings.changePassword,
                icon: Assets.iconsPasswordChange,
                routeTo: AppRoutesNames.rChangePasswordScreen,
              ),
              Spacing.spaceHS32,
            ],
          ),
        ),
      ).paddingBody(),
    );
  }
}
