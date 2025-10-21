import 'dart:io';

import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/shared_widget/app_input_field/email_filed.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/auth/login/presentation/widgets/widgets.dart';
import 'package:ecommerce_app/features/intro/global/global_view_model/global_bloc.dart';
import 'package:ecommerce_app/features/shared_features/get_social_data/presentation/get_social_view/get_social_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/resources/app_strings.dart';
import '../../../../config/routes/route_manager.dart';
import '../../../../config/routes/routes_names.dart';
import '../../../../core/base_widgets/loading_widget.dart';
import '../../../../core/base_widgets/snackbar_widget.dart';
import '../../../../core/enum/enum_generation.dart';
import '../../../../core/responsive_manager/spacing_facade.dart';
import '../../../../core/shared_widget/app_input_field/address_field.dart';
import '../../../../core/shared_widget/app_input_field/confirm_password_filed.dart';
import '../../../../core/shared_widget/app_input_field/name_filed.dart';
import '../../../../core/shared_widget/app_input_field/password_filed.dart';
import '../../../../core/shared_widget/app_input_field/phone_filed.dart';
import '../../../../core/shared_widget/buttons/button_widget.dart';
import '../../../../core/shared_widget/divider_or_widget.dart';
import '../../../../core/shared_widget/image_pick/pick_image.dart';
import '../../../../core/shared_widget/select_gender.dart';
import '../../../../core/text_styling/tokens/app_font_weights.dart';
import '../../../../my_app/app_reference.dart';
import '../../login/login.dart';
import '../../verification/verification.dart';
import '../sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _nameFocusNode;
  late final FocusNode _addressFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  late final FocusNode _phoneFocusNode;

  GenderType _genderType = GenderType.male;
  File file = File('');

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _addressFocusNode.dispose();
    _addressController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            switch (state.sendVerificationCodeStates) {
              case RequestStates.loading:
                showLoadingDialog(context);
              case RequestStates.loaded:
                _goToVerificationScreen(context, state);
              case RequestStates.error:
                _errorCase(context, state);
              default:
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            switch (state.socialLoginStates) {
              case RequestStates.loading:
                showLoadingDialog(context);
              case RequestStates.loaded:
                Navigator.of(context).pop();
                _checkChildIsBlockedOrNot(state.loginMessage);
              case RequestStates.error:
                Navigator.of(context).pop();
                showSnackBar(
                  description: state.loginMessage,
                  state: ToastStates.error,
                  context: context,
                );
              default:
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
          _confirmPasswordFocusNode.unfocus();
          _nameFocusNode.unfocus();
          _addressFocusNode.unfocus();
          _phoneFocusNode.unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.createAnAccount,
                      style: context.typography.displayMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -1.60,
                      ),
                    ),
                    Text(
                      AppStrings.letsCreateYourAccount,
                      style: context.typography.titleMedium.copyWith(
                        color: context.colors.primary5,
                        fontWeight: MobileAppFontWeightsConfig().regular,
                      ),
                    ),
                    Spacing.spaceHS24,

                    NameInputFiled(
                      nameController: _nameController,
                      nameFocusNode: _nameFocusNode,
                      nextFocusNode: _emailFocusNode,
                    ),

                    Spacing.spaceHS16,
                    EmailInputFiled(
                      emailController: _emailController,
                      emailFocusNode: _emailFocusNode,
                      nextFocusNode: _phoneFocusNode,
                    ),
                    Spacing.spaceHS16,
                    PhoneInputFiled(
                      phoneController: _phoneController,
                      phoneFocusNode: _phoneFocusNode,
                      nextFocusNode: _addressFocusNode,
                    ),
                    Spacing.spaceHS16,
                    AddressInputFiled(
                      addressController: _addressController,
                      addressFocusNode: _addressFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    Spacing.spaceHS16,
                    PasswordInputFiled(
                      passwordController: _passwordController,
                      passwordFocusNode: _passwordFocusNode,
                      nextFocusNode: _confirmPasswordFocusNode,
                    ),
                    Spacing.spaceHS16,
                    ConfirmPasswordInputFiled(
                      confirmPasswordController: _confirmPasswordController,
                      confirmPasswordFocusNode: _confirmPasswordFocusNode,
                    ),
                    Spacing.spaceHS16,
                    SelectGender(
                      onGenderSelected: (genderType) {
                        _genderType = genderType;
                      },
                    ),
                    Spacing.spaceHS16,
                    CustomImagePickerWidget(
                      onImageChanged: (File? image) {
                        setState(() {
                          file = image ?? File('');
                        });
                      },
                    ),
                    Spacing.spaceHS16,
                    const TermsText(),
                    Spacing.spaceHS16,
                    // TermsAndConditionView(isAgree: (value) => isAgree = value),
                    DefaultButtonWidget(
                      label: AppStrings.newAccount,

                      onPressed: () {
                        _checkIfFieldsValidateNSendVerificationCode(context);
                      },
                    ),
                    Spacing.spaceHS16,
                    const DividerOrWidget(),
                    Spacing.spaceHS16,
                    GetSocialView(),
                    Spacing.spaceHS16,
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.alreadyHaveAnAccount,
                              style: context.typography.bodyMedium,
                            ),
                            TextSpan(
                              text: AppStrings.login,
                              style: context.typography.bodyLarge.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _goToLoginScreen();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ContactUsWidgetInLoginScreen(),
                  ],
                ),
              ),
            ),
          ).paddingBody(),
        ),
      ),
    );
  }

  void _errorCase(BuildContext context, SignUpState state) {
    Navigator.pop(context);
    showSnackBar(
      description: state.sendVerificationCodeMessage,
      state: ToastStates.error,
      context: context,
    );
  }

  void _checkChildIsBlockedOrNot(String loginMessage) {
    if (context.read<LoginBloc>().userData.isLocked == true) {
      showSnackBar(
        description: AppStrings.contactWithOwner,
        state: ToastStates.error,
        context: context,
      );
      return;
    } else {
      showSnackBar(
        description: loginMessage,
        state: ToastStates.congrats,
        context: context,
      );
      _goToHome();
    }
  }

  void _goToHome() {
    context.read<GlobalBloc>().fromRegister = true;
    RouteManager.rPushNamedAndRemoveUntil(
      context: context,
      rName: AppRoutesNames.rHomeLayoutView,
    );
  }

  void _goToLoginScreen() {
    RouteManager.rPopRoute(context);
  }

  void _goToVerificationScreen(BuildContext context, SignUpState state) {
    Navigator.pop(context);
    showSnackBar(
      description: state.sendVerificationCodeMessage,
      state: ToastStates.congrats,
      context: context,
    );
    RouteManager.rPushNamed(
      context: context,
      rName: AppRoutesNames.rVerificationScreen,
      arguments: {
        "signUpParameter": SignUpParameter(
          name: _nameController.text,
          phone: AppReference.formatPhoneNumber(_phoneController.text),
          email: _emailController.text,
          gender: _genderType.name,
          img: file.path,
          password: _passwordController.text,
          address: _addressController.text,
        ),
        "sendVerificationCodeParameter": SendVerificationCodeParameter(
          email: _emailController.text,
        ),
      },
    );
  }

  void _checkIfFieldsValidateNSendVerificationCode(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        showSnackBar(
          description: AppStrings.confirmPasswordNotCorrect,
          state: ToastStates.warning,
          context: context,
        );
      } else {
        _sendVerificationCode(context);
      }
    } else if (!_formKey.currentState!.validate()) {
      showSnackBar(
        description: AppStrings.alarmForCompleteUserData,
        state: ToastStates.warning,
        context: context,
      );
    }
  }

  void _sendVerificationCode(BuildContext context) {
    context.read<SignUpBloc>().add(
      VerificationCodeSentEvent(
        sendVerificationCodeParams: SendVerificationCodeParameter(
          email: _emailController.text,
        ),
      ),
    );
  }
}

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text("Here goes the content of $title."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By signing up you agree to our ',
            style: context.typography.bodySmall,
          ),
          TextSpan(
            text: 'Terms',
            style: context.typography.bodyMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _showDialog(context, "Terms");
              },
          ),
          TextSpan(text: ', ', style: context.typography.bodySmall),
          TextSpan(
            text: 'Privacy Policy',
            style: context.typography.bodyMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _showDialog(context, "Privacy Policy");
              },
          ),
          TextSpan(text: ', and ', style: context.typography.bodySmall),
          TextSpan(
            text: 'Cookie Use',
            style: context.typography.bodyMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _showDialog(context, "Cookie Use");
              },
          ),
        ],
      ),
    );
  }
}
