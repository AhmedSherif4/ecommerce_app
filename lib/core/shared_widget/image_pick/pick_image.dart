import 'dart:io';

import 'package:ecommerce_app/config/resources/app_constants.dart';
import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart' as AppSettings;
import 'package:permission_handler/permission_handler.dart';

import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/base_widgets/snackbar_widget.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/shared_widget/custom_inkwell.dart';
import '../../../../../core/shared_widget/dialogs/permissions_dialog.dart';
import '../../../../../my_app/app_permission.dart';
import '../../../../../my_app/app_reference.dart';
import 'image_pick_view_model/image_pick_bloc.dart';
import 'image_pick_view_model/image_pick_event.dart';
import 'image_pick_view_model/image_pick_state.dart';
import 'image_picker_sheet.dart';

class CustomImagePickerWidget extends StatefulWidget {
  final Function(File?) onImageChanged;
  final String? initialImagePath;
  final String pickYourPhoto;
  final String titleText;
  final String descriptionText;

  const CustomImagePickerWidget({
    super.key,
    required this.onImageChanged,
    this.initialImagePath,
    this.pickYourPhoto = AppStrings.pickYourPhoto,
    this.titleText = AppStrings.uploadPP,
    this.descriptionText = AppStrings.uploadPPDescription,
  });

  @override
  State<CustomImagePickerWidget> createState() =>
      _CustomImagePickerWidgetState();
}

class _CustomImagePickerWidgetState extends State<CustomImagePickerWidget> {
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    if (widget.initialImagePath != null) {
      selectedImage = File(widget.initialImagePath!);
    }
  }

  // نسخ نفس اللوجيك من PickImageInkWell
  _pickImageHandler(context) async {
    if (await AppPermissions.photosPermissionStatus()) {
      _pickImageEvent(context);
    } else if (await AppPermissions.photosPermission.isLimited) {
      _pickImageEvent(context);
    } else if (await AppPermissions.photosPermission.isDenied) {
      if (context.mounted) {
        showPermissionsDialog(
          context: context,
          title: AppStrings.permission,
          message: AppStrings.photoPermissionMessage,
          buttonText1: AppStrings.ok,
          buttonOnPressed1: () async {
            await AppPermissions.photosPermissionRequest();
            if (context.mounted) Navigator.pop(context);
            if (await AppPermissions.photosPermission.isGranted) {
              if (context.mounted) {
                _pickImageEvent(context);
              }
            }
          },
          buttonText2: AppStrings.notNow,
          buttonOnPressed2: () async {
            await AppPermissions.photosPermissionRequest();
            if (context.mounted) Navigator.pop(context);
            if (await AppPermissions.photosPermission.isGranted) {
              if (context.mounted) {
                _pickImageEvent(context);
              }
            }
          },
        );
      }
    } else if (await AppPermissions.photosPermission.isPermanentlyDenied) {
      if (context.mounted) {
        showPermissionsDialog(
          context: context,
          title: AppStrings.permission,
          message: AppStrings.photoPermissionMessage,
          buttonText1: AppStrings.ok,
          buttonOnPressed1: () async {
            if (await openAppSettings()) {
              await AppSettings.openAppSettings().then(
                (value) => Navigator.pop(context),
              );
            } else {
              if (context.mounted) {
                Navigator.pop(context);
                showSnackBar(
                  description: AppStrings.deviceNotSupported,
                  state: ToastStates.info,
                  context: context,
                );
              }
            }
          },
          buttonText2: AppStrings.notNow,
          buttonOnPressed2: () => Navigator.pop(context),
        );
      }
    }
  }

  _pickImageEvent(context) {
    BlocProvider.of<ImagePickBloc>(
      context,
    ).add(const ImagePickerEvent(ImageSource.gallery));
  }

  _cameraHandler(context) async {
    if (await AppPermissions.cameraPermissionStatus()) {
      _cameraEvent(context);
    } else if (await AppPermissions.cameraPermission.isLimited) {
      _cameraEvent(context);
    } else if (await AppPermissions.cameraPermission.isDenied) {
      if (context.mounted) {
        showPermissionsDialog(
          context: context,
          title: AppStrings.permission,
          message: AppStrings.cameraPermissionMessage,
          buttonText1: AppStrings.ok,
          buttonOnPressed1: () async {
            await AppPermissions.cameraPermissionRequest();
            if (context.mounted) Navigator.pop(context);
            if (await AppPermissions.cameraPermission.isGranted) {
              if (context.mounted) {
                _cameraEvent(context);
              }
            }
          },
          buttonText2: AppStrings.notNow,
          buttonOnPressed2: () async {
            await AppPermissions.cameraPermissionRequest();
            if (context.mounted) Navigator.pop(context);
            if (await AppPermissions.cameraPermission.isGranted) {
              if (context.mounted) {
                _cameraEvent(context);
              }
            }
          },
        );
      }
    } else if (await AppPermissions.cameraPermission.isPermanentlyDenied) {
      if (context.mounted) {
        showPermissionsDialog(
          context: context,
          title: AppStrings.permission,
          message: AppStrings.cameraPermissionMessage,
          buttonText1: AppStrings.ok,
          buttonOnPressed1: () async {
            if (await openAppSettings()) {
              await AppSettings.openAppSettings().then(
                (value) => Navigator.pop(context),
              );
            } else {
              if (context.mounted) {
                Navigator.pop(context);
                showSnackBar(
                  description: AppStrings.deviceNotSupported,
                  state: ToastStates.info,
                  context: context,
                );
              }
            }
          },
          buttonText2: AppStrings.notNow,
          buttonOnPressed2: () => Navigator.pop(context),
        );
      }
    }
  }

  _cameraEvent(context) {
    BlocProvider.of<ImagePickBloc>(
      context,
    ).add(const ImagePickerEvent(ImageSource.camera));
  }

  String _getFileName(File file) {
    return file.path.split('/').last;
  }

  void _removeImage(BuildContext buildCtx) {
    setState(() {
      selectedImage = null;
    });
    widget.onImageChanged(null);
    buildCtx.read<ImagePickBloc>().add(const ResetImagePickerEvent());
  }

  void _showImagePickerSheet(BuildContext buildCtx) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerSheet(
          onPickType: (sourceType) async {
            if (sourceType == ImageSourceType.gallery) {
              if (await AppReference.isAndroid13AndNewer() ||
                  AppReference.deviceIsIos) {
                if (buildCtx.mounted) {
                  _pickImageHandler(buildCtx);
                }
              } else {
                if (buildCtx.mounted) {
                  _pickImageEvent(buildCtx);
                }
              }
            } else {
              if (buildCtx.mounted) {
                _cameraHandler(buildCtx);
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocProvider(
          create: (_) => getIt<ImagePickBloc>(),
          child: Builder(
            builder: (buildCtx) {
              return BlocBuilder<ImagePickBloc, ImagePickState>(
                builder: (context, state) {
                  // إذا لم يتم اختيار صورة من قبل وحالة البلوك هي init
                  if (selectedImage == null &&
                      state.pickImageState == PickImageState.init) {
                    return CustomInkWell(
                      onTap: () {
                        _showImagePickerSheet(buildCtx);
                      },
                      child: SizedBox(
                        width: Spacing.pickYourPhoto,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR15,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.appPaddingR10,
                          ),
                          child: Text(
                            widget.pickYourPhoto,
                            style: context.typography.bodySmall.copyWith(
                              color: context.colors.primary0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                  // إذا كان في حالة تحميل
                  else if (state.pickImageState ==
                      PickImageState.startLoadingImage) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  // إذا تم اختيار الصورة بنجاح
                  else if (state.pickImageState ==
                      PickImageState.imagePickedSuccessfully) {
                    final pickedFile = context.read<ImagePickBloc>().imageFile!;

                    // تحديث الصورة المختارة
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (selectedImage?.path != pickedFile.path) {
                        setState(() {
                          selectedImage = pickedFile;
                        });
                        widget.onImageChanged(pickedFile);
                      }
                    });

                    return _buildSelectedImageWidget(pickedFile, buildCtx);
                  }
                  // إذا حدث خطأ
                  else if (state.pickImageState ==
                      PickImageState.imagePickedError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showSnackBar(
                        description: state.pickImageErrorMessage,
                        state: ToastStates.error,
                        context: context,
                      );
                    });

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showImagePickerSheet(buildCtx);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR15,
                            ),
                          ),
                        ),
                        child: Text(
                          widget.pickYourPhoto,
                          style: TextStyle(
                            fontSize: 14.f,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }
                  // / // إذا كان هناك صورة مختارة مسبقاً
                  else if (selectedImage != null) {
                    return _buildSelectedImageWidget(selectedImage!, buildCtx);
                  }
                  // الحالة الافتراضية
                  else {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showImagePickerSheet(buildCtx);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR15,
                            ),
                          ),
                        ),
                        child: Text(
                          widget.pickYourPhoto,
                          style: context.typography.bodySmall.copyWith(
                            color: context.colors.primary2,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            widget.titleText,
            style: context.typography.bodySmall,
          ),
        ),
        Spacing.spaceHS5,
        FittedBox(
          fit: BoxFit.scaleDown, // يصغر النص لو أكبر من المساحة
          child: Text(
            widget.descriptionText,
            style: context.typography.caption.copyWith(
              color: context.colors.primary5,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // يضيف "..." لو النص أكبر
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedImageWidget(File imageFile, BuildContext buildCtx) {
    return Stack(
      clipBehavior: Clip.none, // علشان الزرار يطلع برا حدود الStack
      children: [
        Container(
          width: Spacing.splashLogo,
          height: Spacing.splashLogo,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, color: Colors.grey);
              },
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: CustomInkWell(
            onTap: () {
              _removeImage(buildCtx);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close, size: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
