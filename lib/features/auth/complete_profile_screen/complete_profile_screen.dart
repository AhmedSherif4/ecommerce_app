import 'dart:io';

import 'package:ecommerce_app/core/base_widgets/loading_widget.dart';
import 'package:ecommerce_app/core/base_widgets/snackbar_widget.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_bloc.dart';
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_event.dart';
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/resources/app_strings.dart';
import '../../../config/routes/route_manager.dart';
import '../../../config/routes/routes_names.dart';
import '../../../core/responsive_manager/spacing_facade.dart';
import '../../../core/shared_widget/app_input_field/address_field.dart';
import '../../../core/shared_widget/app_input_field/phone_filed.dart';
import '../../../core/shared_widget/buttons/button_widget.dart';
import '../../../core/shared_widget/image_pick/pick_image.dart';
import '../../../core/shared_widget/select_gender.dart';
import 'domain/social_register_usecases/social_register_usecase.dart';

class CompleteProfileScreen extends StatefulWidget {
  final UserEntity user;
  const CompleteProfileScreen({super.key, required this.user});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String genderType = GenderType.male.name;
  File file = File('');

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _phoneController;

  late final FocusNode _phoneFocusNode;

  late final FocusNode _addressFocusNode;

  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: widget.user.address);
    _phoneController = TextEditingController(text: widget.user.phone);
    _addressFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _addressFocusNode.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _phoneFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialRegisterBloc, SocialRegisterState>(
      listener: (context, state) {
        switch (state.signUpStates) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            Navigator.pop(context);
            RouteManager.rPushNamedAndRemoveUntil(
              context: context,
              rName: AppRoutesNames.rHomeLayoutView,
            );
          case RequestStates.error:
            Navigator.pop(context);
            showSnackBar(
              description: state.signUpMessage,
              state: ToastStates.error,
              context: context,
            );
          default:
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.continueYourInformation,
                          style: context.typography.titleLarge,
                        ),
                        Spacing.spaceHS24,
                        if ((widget.user.phone?.isEmpty ?? true)) ...[
                          PhoneInputFiled(
                            phoneController: _phoneController,
                            phoneFocusNode: _phoneFocusNode,
                            nextFocusNode: _addressFocusNode,
                          ),
                          Spacing.spaceHS16,
                        ],
                        if ((widget.user.address?.isEmpty ?? true)) ...[
                          AddressInputFiled(
                            addressController: _addressController,
                            addressFocusNode: _addressFocusNode,
                          ),
                          Spacing.spaceHS16,
                        ],

                        if ((widget.user.gender?.isEmpty ?? true)) ...[
                          SelectGender(
                            onGenderSelected: (value) {
                              genderType = value.name;
                            },
                          ),
                          Spacing.spaceHS16,
                        ],
                        if ((widget.user.imgPath?.isEmpty ?? true)) ...[
                          CustomImagePickerWidget(
                            onImageChanged: (File? image) {
                              setState(() {
                                file = image ?? File('');
                              });
                            },
                            pickYourPhoto: AppStrings.pickYourPhoto,
                          ),
                          Spacing.spaceHS16,
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              DefaultButtonWidget(
                label: AppStrings.confirm,
                onPressed: _updateUserProfile,
              ),
              Spacing.spaceHS16,
            ],
          ),
        ).paddingBody(),
      ),
    );
  }

  _updateUserProfile() {
    if (_formKey.currentState!.validate() &&
        (file.path.isNotEmpty || (widget.user.imgPath?.isNotEmpty ?? false))) {
      context.read<SocialRegisterBloc>().add(
        SignedUpEvent(
          signUpParameter: SocialRegisterData(
            photoUrl: ((widget.user.imgPath?.isEmpty ?? true))
                ? file.path
                : null,
            gender: (widget.user.gender?.isEmpty ?? true) ? genderType : null,
            address: (widget.user.address?.isEmpty ?? true)
                ? _addressController.text
                : null,
            phone: (widget.user.phone?.isEmpty ?? true)
                ? _phoneController.text
                : null,
          ),
        ),
      );
    } else if (!_formKey.currentState!.validate()) {
      showSnackBar(
        description: AppStrings.alarmForCompleteUserData,
        state: ToastStates.warning,
        context: context,
      );
    }
  }
}
