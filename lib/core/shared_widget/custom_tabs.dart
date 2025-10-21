import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_inkwell.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({
    super.key,
    required this.firstTabText,
    required this.secondTabText,
    this.onTabChanged,
  });

  final String firstTabText;
  final String secondTabText;
  final Function(int)? onTabChanged;

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  int selectedTab = 0;

  void _onTabSelected(int index) {
    setState(() {
      selectedTab = index;
    });
    widget.onTabChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.tabBarHeight, // Responsive height
      decoration: BoxDecoration(
        color: context.colors.primary5,
        borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r), // Responsive padding
        child: Row(
          children: [
            Expanded(
              child: CustomInkWell(
                onTap: () => _onTabSelected(0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedTab == 0
                        ? context.colors.primary4
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppBorders.appBorderWidthR15,
                    ),
                  ),
                  child: Text(
                    widget.firstTabText,
                    style: context.typography.bodyMedium.copyWith(
                      color: selectedTab == 0
                          ? context.colors.primary9
                          : context.colors.primary4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomInkWell(
                onTap: () => _onTabSelected(1),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedTab == 1
                        ? context.colors.primary4
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppBorders.appBorderWidthR15,
                    ),
                  ),
                  child: Text(
                    widget.secondTabText,
                    style: context.typography.bodyMedium.copyWith(
                      color: selectedTab == 1
                          ? context.colors.primary9
                          : context.colors.primary4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
