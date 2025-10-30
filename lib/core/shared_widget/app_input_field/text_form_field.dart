import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_inkwell.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextDirection textDirection;

  final String? hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? label;
  final String? suffixIconPath;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction inputAction;
  final bool isObscureText;
  final bool isReadOnly;

  final IconData? suffixIcon;
  final dynamic Function()? suffixIconOnPress;
  final String? Function(String?)? validator;
  final int maxLine;

  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    required this.keyboardType,
    this.focusNode,

    required this.inputAction,
    this.isObscureText = false,
    this.textDirection = TextDirection.rtl,
    this.suffixIcon,
    this.suffixIconPath,
    this.suffixIconOnPress,
    this.validator,
    this.maxLine = 1,
    this.label,
    required this.onFieldSubmitted,
    this.inputFormatters,
    this.isReadOnly = false,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*if (label != null) ...[
          Text(label ?? "", style: context.typography.titleMedium),
        ],
        Spacing.spaceHS5,*/
        TextFormField(
          autovalidateMode: AutovalidateMode.disabled,
          obscuringCharacter: '●',
          style: context.typography.titleMedium,
          textDirection: textDirection,
          readOnly: isReadOnly,
          controller: controller,
          autocorrect: true,
          maxLines: maxLine,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: context.colors.primary9,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: inputAction,
          obscureText: isObscureText,
          enableSuggestions: true,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: context.typography.titleMedium.copyWith(
              color: context.colors.primary9,
            ),
            hintText: hintText,
            hintStyle: context.typography.titleMedium.copyWith(
              color: context.colors.primary4,
            ),
            suffixIcon: (suffixWidget != null)
                ? suffixWidget
                : (suffixIcon == null && suffixIconPath == null)
                ? null
                : CustomInkWell(
                    onTap: suffixIconOnPress ?? () {},
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 25.w),
                      child: SvgPicture.asset(
                        suffixIconPath ?? Assets.iconsPasswordChange,
                        height: Spacing.iconSizeS20.h,
                        width: Spacing.iconSizeS20.w,
                        color: context.colors.primary9.withValues(
                          alpha: (focusNode != null)
                              ? (focusNode!.hasFocus ? 1 : 0.5)
                              : 1,
                        ),
                      ),
                    ),
                  ),
          ),
          inputFormatters: inputFormatters,
        ),
        // bottomSizedBox.sizedBoxHeight,
      ],
    );
  }
}
