import 'dart:io';

import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../../../core/shared_models/user/user_entity/user_entity.dart';

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
      {
        'title': AppStrings.name,
        'subtitle': userData.name,
        'withEdit': true,
        'routeTo': AppRoutesNames.rEditProfileScreen,
      },

      {
        'title': AppStrings.email,
        'subtitle': userData.email ?? '',
        'withEdit': true,
        'routeTo': AppRoutesNames.rEditProfileScreen,
      },
      {
        'title': AppStrings.phone,
        'subtitle': userData.phone ?? '',
        'withEdit': true,
        'routeTo': AppRoutesNames.rEditProfileScreen,
      },
    ];

    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           HeaderForMore(title: 'My Details'),
    //           PickImageInkWell(
    //             pickImageWidget: ImageAccountMoreWidget(
    //               withCamera: true,
    //               imageFile: imageFile,
    //             ),
    //             loadingPickImageWidget: ImageAccountMoreWidget(
    //               withCamera: true,
    //               imageFile: imageFile,
    //             ),
    //             loadedPickImageWidget: StatefulBuilder(
    //               builder: (context, updateState) {
    //                 return ImageAccountMoreWidget(
    //                   withCamera: true,
    //                   imageFile: imageFile,
    //                 );
    //               },
    //             ),
    //             errorPickImageWidget: ImageAccountMoreWidget(
    //               withCamera: true,
    //               imageFile: imageFile,
    //             ),
    //             pickImageShape: PickImageShape.bottomSheet,
    //             permissionDialogMessage: AppStrings.permissionPhotoMessage,
    //             onErrorMessage: (value) {},
    //             onPickFile: (value) {
    //               imageFile = value;
    //               getIt<EditProfileBloc>().add(
    //                 EditProfile(image: imageFile.path, withImage: true),
    //               );
    //             },
    //           ),
    //           Spacing.spaceHS10,
    //           if ((AppReference.deviceIsTablet &&
    //               !AppReference.isPortrait(context)))
    //             Container(
    //               padding: EdgeInsets.all(20.r),
    //               decoration: BoxDecoration(
    //                 color: context.colors.primary0,
    //                 borderRadius: BorderRadius.circular(
    //                   AppConstants.appBorderRadiusR20,
    //                 ),
    //               ),
    //               child: GridView(
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                       childAspectRatio: 8 / .8,
    //                       crossAxisCount: 2,
    //                       mainAxisSpacing: 20,
    //                       crossAxisSpacing: 30,
    //                     ),
    //                 shrinkWrap: true,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 children: [
    //                   ...data.map(
    //                     (e) => ListTileUpdateUserDataWidget(
    //                       title: e['title'],
    //                       subtitle: e['subtitle'],
    //                       withEdit: e['withEdit'],
    //                       routeTo: e['routeTo'] as String?,
    //                     ),
    //                   ),
    //                   (userData.socialId?.isEmpty ?? true)
    //                       ? const ChangePasswordUpdateUserDataWidget(
    //                           title: AppStrings.changePassword,
    //                           icon: AppIconsAssets.sPasswordChange,
    //                           routeTo: AppRoutesNames.rChangePasswordScreen,
    //                         )
    //                       : const SizedBox.shrink(),
    //                 ],
    //               ),
    //             ),
    //           if (!AppReference.deviceIsTablet ||
    //               (AppReference.deviceIsTablet &&
    //                   AppReference.isPortrait(context))) ...[
    //             ListView.separated(
    //               itemBuilder: (context, index) => ListTileUpdateUserDataWidget(
    //                 withAdd: data[index]['subtitle'] == "",
    //                 withCopy: data[index]['title'] == AppStrings.userName,
    //
    //                 title: data[index]['title'],
    //                 subtitle: data[index]['subtitle'],
    //                 withEdit: data[index]['withEdit'],
    //                 routeTo: data[index]['routeTo'] as String?,
    //               ),
    //               separatorBuilder: (context, index) => Divider(
    //                 color: AppColors.textColor6,
    //                 endIndent: 20.responsiveWidth,
    //                 height: 30.responsiveWidth,
    //                 indent: 50.responsiveWidth,
    //               ),
    //               itemCount: data.length,
    //               shrinkWrap: true,
    //               physics: const NeverScrollableScrollPhysics(),
    //             ),
    //             50.sizedBoxHeight,
    //             (userData.socialId?.isEmpty ?? true)
    //                 ? const ChangePasswordUpdateUserDataWidget(
    //                     title: AppStrings.changePassword,
    //                     icon: AppIconsAssets.sPasswordChange,
    //                     routeTo: AppRoutesNames.rChangePasswordScreen,
    //                   )
    //                 : const SizedBox.shrink(),
    //           ],
    //         ],
    //       ),
    //     ),
    //   ).paddingBody(),
    // );
    return const SizedBox();
  }
}
