import 'package:flutter/material.dart';

import '../../../app_assets/app_assets.dart';
import '../../../config/resources/app_strings.dart';
import '../../validation/app_validation.dart';
import 'text_form_field.dart';

class PasswordInputFiled extends StatefulWidget {
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final FocusNode? nextFocusNode;
  final String label;

  const PasswordInputFiled({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
    this.label = AppStrings.password,
    this.nextFocusNode,
  });

  @override
  State<PasswordInputFiled> createState() => _PasswordInputFiledState();
}

class _PasswordInputFiledState extends State<PasswordInputFiled> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      textDirection: TextDirection.ltr,
      controller: widget.passwordController,
      label: widget.label,
      hintText: AppStrings.passwordHint,
      keyboardType: TextInputType.visiblePassword,
      validator: AppValidation.passwordValidation(),
      onFieldSubmitted: (value) => widget.nextFocusNode != null
          ? FocusScope.of(context).requestFocus(widget.nextFocusNode)
          : FocusScope.of(context).unfocus(),
      isObscureText: isObscureText,
      focusNode: widget.passwordFocusNode,
      inputAction: TextInputAction.next,
      suffixIconPath: isObscureText
          ? Assets.projectIconEyeOff
          : Assets.projectIconEye,
      suffixIconOnPress: () {
        setState(() {
          isObscureText = !isObscureText;
        });
      },
    );
  }
}
