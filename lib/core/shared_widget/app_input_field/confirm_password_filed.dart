import 'package:flutter/material.dart';

import '../../../app_assets/app_assets.dart';
import '../../../config/resources/app_strings.dart';
import '../../validation/app_validation.dart';
import 'text_form_field.dart';

class ConfirmPasswordInputFiled extends StatefulWidget {
  final TextEditingController confirmPasswordController;
  final FocusNode confirmPasswordFocusNode;

  const ConfirmPasswordInputFiled({
    super.key,
    required this.confirmPasswordController,
    required this.confirmPasswordFocusNode,
  });

  @override
  State<ConfirmPasswordInputFiled> createState() =>
      _ConfirmPasswordInputFiledState();
}

class _ConfirmPasswordInputFiledState extends State<ConfirmPasswordInputFiled> {
  bool isObscureTextForConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      textDirection: TextDirection.ltr,
      controller: widget.confirmPasswordController,
      label: AppStrings.confirmPassword,
      hintText: AppStrings.confirmPasswordHint,
      keyboardType: TextInputType.visiblePassword,
      validator: AppValidation.passwordValidation(),
      onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
      focusNode: widget.confirmPasswordFocusNode,
      isObscureText: isObscureTextForConfirmPassword,
      inputAction: TextInputAction.next,
      suffixIconPath: isObscureTextForConfirmPassword
          ? Assets.projectIconEyeOff
          : Assets.projectIconEye,
      suffixIconOnPress: () {
        setState(() {
          isObscureTextForConfirmPassword = !isObscureTextForConfirmPassword;
        });
      },
    );
  }
}
