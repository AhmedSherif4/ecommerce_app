import 'package:flutter/material.dart';

import '../../../config/resources/app_strings.dart';
import '../../validation/app_validation.dart';
import 'text_form_field.dart';

class EmailInputFiled extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode? emailFocusNode;
  final FocusNode? nextFocusNode;

  const EmailInputFiled({
    super.key,
    required this.emailController,
    this.emailFocusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      textDirection: TextDirection.ltr,
      controller: emailController,
      label: AppStrings.email,
      hintText: AppStrings.emailHint,
      keyboardType: TextInputType.emailAddress,
      validator: AppValidation.emailValidation(),
      onFieldSubmitted: (value) => emailFocusNode != null
          ? FocusScope.of(context).requestFocus(nextFocusNode)
          : FocusScope.of(context).unfocus(),
      focusNode: emailFocusNode,
      inputAction: TextInputAction.next,
    );
  }
}
