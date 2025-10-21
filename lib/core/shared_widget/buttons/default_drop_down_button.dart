import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../my_app/app_reference.dart';
import '../../responsive_manager/spacing_facade.dart';
import '../../theme_manager/service/app_colors.dart';

class DefaultDropDownButton<T> extends StatelessWidget {
  final List<T> studyingData;
  final T selectedItem;
  final Function(T?) onChange;
  final String Function(T) displayText;
  final String? icon;
  final bool withSuffixIcon;
  final Color color;
  final Color? labelColor;

  const DefaultDropDownButton({
    super.key,
    required this.studyingData,
    required this.selectedItem,
    required this.onChange,
    required this.displayText,
    this.icon,
    this.withSuffixIcon = false,
    this.color = Colors.white,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.s50,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
        border: Border.all(
          color: context.colors.primary4.withValues(alpha: 0.5),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: selectedItem,
          onChanged: onChange,
          icon: icon != null
              ? SvgPicture.asset(icon!)
              : SvgPicture.asset(Assets.iconsArrowDown),
          dropdownColor: Colors.white,
          menuMaxHeight: AppReference.deviceHeight(context) * 0.3,
          style: context.typography.titleMedium.copyWith(
            color: labelColor ?? context.colors.primary3,
          ),
          alignment: AlignmentDirectional.centerEnd,
          items: studyingData.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                displayText(item),
                textAlign: TextAlign.right,
                style: context.typography.bodyMedium.copyWith(
                  color: context.colors.primary4.withOpacity(0.5),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
