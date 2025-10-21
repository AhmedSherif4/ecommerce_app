import 'package:flutter/material.dart';

import '../../../config/resources/app_strings.dart';
import '../../validation/app_validation.dart';
import 'text_form_field.dart';

class NameInputFiled extends StatelessWidget {
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final FocusNode? nextFocusNode;
  final void Function(String)? nextFocusAction;

  const NameInputFiled({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    this.nextFocusNode,
    this.nextFocusAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      textDirection: TextDirection.ltr,
      controller: nameController,
      label: AppStrings.name,
      hintText: AppStrings.enterYourFullName,
      keyboardType: TextInputType.name,
      validator: AppValidation.nameValidation(),
      onFieldSubmitted:
          nextFocusAction ??
          (value) => FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: nameFocusNode,
      inputAction: TextInputAction.next,
    );
  }
}
