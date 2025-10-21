import 'package:flutter/material.dart';

import '../../../config/resources/app_strings.dart';
import 'text_form_field.dart';

class AddressInputFiled extends StatelessWidget {
  final TextEditingController addressController;
  final FocusNode addressFocusNode;
  final FocusNode? nextFocusNode;
  final void Function(String)? nextFocusAction;

  const AddressInputFiled({
    super.key,
    required this.addressController,
    required this.addressFocusNode,
    this.nextFocusNode,
    this.nextFocusAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      textDirection: TextDirection.ltr,
      controller: addressController,
      label: AppStrings.address,
      hintText: AppStrings.enterYourAddress,
      keyboardType: TextInputType.text,
      onFieldSubmitted:
          nextFocusAction ??
          (value) => FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: addressFocusNode,
      inputAction: TextInputAction.next,
    );
  }
}
