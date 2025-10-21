import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldWidget extends StatelessWidget {
  final Function(String) onComplete;

  const PinCodeFieldWidget({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: context.colors.primary9,
        keyboardType: TextInputType.number,
        textStyle: context.typography.bodyLarge,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
          fieldHeight: Spacing.verificationItemSize,
          fieldWidth: Spacing.verificationItemSize,
          borderWidth: 1,
          activeColor: context.colors.primary1,
          activeFillColor: context.colors.primary1,
          inactiveColor: context.colors.primary1,
          inactiveFillColor: context.colors.primary1,
          selectedColor: context.colors.primary1,
          selectedFillColor: context.colors.primary1,
          disabledColor: context.colors.primary1,
          errorBorderColor: context.colors.red,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: context.colors.primary0,
        enableActiveFill: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onCompleted: onComplete,
      ),
    );
  }
}
