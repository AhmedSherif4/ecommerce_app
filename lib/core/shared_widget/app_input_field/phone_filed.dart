import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_manager.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/app_input_field/text_form_field.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../config/resources/app_strings.dart';
import '../../../my_app/app_reference.dart';
import '../../validation/app_validation.dart';

class PhoneInputFiled extends StatefulWidget {
  final TextEditingController phoneController;
  final FocusNode? phoneFocusNode;
  final FocusNode? nextFocusNode;

  const PhoneInputFiled({
    super.key,
    required this.phoneController,
    this.phoneFocusNode,
    this.nextFocusNode,
  });

  @override
  State<PhoneInputFiled> createState() => _PhoneInputFiledState();
}

class _PhoneInputFiledState extends State<PhoneInputFiled> {
  String selectedCountryCode = "+20";
  String selectedFlag = Assets.imagesEgyptFlag;
  bool isSvg = true;

  @override
  void initState() {
    super.initState();
    AppReference.countryCode = selectedCountryCode;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: widget.phoneController,
      focusNode: widget.phoneFocusNode,
      keyboardType: TextInputType.number,
      validator: selectedCountryCode == '+20'
          ? AppValidation.egyptianPhoneNumberValidation()
          : AppValidation.phoneNumberValidation(),
      hintText: AppStrings.putYourPhoneNumber,
      label: AppStrings.phoneNumber,
      onFieldSubmitted: (_) {
        if (widget.phoneFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },

      inputAction: TextInputAction.next,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      suffixWidget: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0.w,
          vertical: ResponsiveManager.isTablet ? 0 : 8.0.h,
        ),
        child: PopupMenuButton<String>(
          onSelected: (code) {
            setState(() {
              selectedCountryCode = code;
              AppReference.countryCode = code;
              if (code == '+966') {
                selectedFlag = Assets.imagesSaudiFlag;
                isSvg = true;
              } else if (code == '+20') {
                selectedFlag = Assets.imagesEgyptFlag;
                isSvg = true;
              } else if (code == '+971') {
                selectedFlag = Assets.imagesUA;
                isSvg = false;
              } else if (code == '+974') {
                selectedFlag = Assets.imagesQatar;
                isSvg = false;
              }
            });
          },
          itemBuilder: (context) => [
            _buildPopupMenuItem('+20', 'مصر', Assets.imagesEgyptFlag, true),
            _buildPopupMenuItem(
              '+966',
              'السعودية',
              Assets.imagesSaudiFlag,
              true,
            ),
            _buildPopupMenuItem('+971', 'الإمارات', Assets.imagesUA, false),
            _buildPopupMenuItem('+974', 'قطر', Assets.imagesQatar, false),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
          ),
          color: context.colors.primary1,
          elevation: 8,
          offset: Offset(0, 50.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: context.colors.primary1,
              borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
              border: Border.all(
                color: context.colors.primary4.withValues(alpha: 128),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedCountryCode,
                  textDirection: TextDirection.ltr,
                  style: context.typography.bodyMedium.copyWith(
                    color: context.colors.primary4.withValues(alpha: 128),
                    fontSize: 12,
                  ),
                ),
                Spacing.spaceSW5,
                isSvg
                    ? SvgPicture.asset(selectedFlag, height: 16.h, width: 16.w)
                    : Image.asset(selectedFlag, height: 16.h, width: 16.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    String code,
    String name,
    String flag,
    bool isSvg,
  ) {
    return PopupMenuItem<String>(
      value: code,
      child: SizedBox(
        width: AppReference.deviceWidth(context),
        child: Row(
          children: [
            Text(
              name,
              style: context.typography.caption.copyWith(
                color: context.colors.primary4,
              ),
              textAlign: TextAlign.right,
            ),
            const Spacer(),
            Text(
              code,
              style: context.typography.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colors.primary4,
              ),
              textDirection: TextDirection.ltr,
            ),
            Spacing.spaceSW10,
            isSvg
                ? SvgPicture.asset(flag, height: 24.h, width: 24.w)
                : Image.asset(flag, height: 24.h, width: 24.w),
          ],
        ),
      ),
    );
  }
}
