import 'package:ecommerce_app/core/responsive_manager/responsive_manager.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:flutter/material.dart';

import '../../config/resources/app_strings.dart';
import '../enum/enum_generation.dart';
import '../services/services_locator.dart';
import '../shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../theme_manager/service/app_colors.dart';

class SelectGender extends StatefulWidget {
  final Function(GenderType genderType) onGenderSelected;

  const SelectGender({super.key, required this.onGenderSelected});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  GenderType genderType = GenderType.male;

  @override
  void initState() {
    super.initState();
    if (getIt<UserLocalDataSource>().getUserData() != null) {
      if (getIt<UserLocalDataSource>().getUserData()!.gender == 'male') {
        genderType = GenderType.male;
      } else if (getIt<UserLocalDataSource>().getUserData()!.gender ==
          'female') {
        genderType = GenderType.female;
      } else {
        genderType = GenderType.other;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(AppStrings.gender, style: context.typography.titleMedium),
        ),
        Expanded(
          flex: 2,
          child: RadioGroup<GenderType>(
            groupValue: genderType,
            onChanged: (GenderType? newValue) {
              if (newValue == null) return;
              setState(() => genderType = newValue);
              widget.onGenderSelected(newValue);
            },

            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: ResponsiveManager.isTablet ? 2.1 : 1.5,
                        child: Radio<GenderType>(
                          value: GenderType.male,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          fillColor: WidgetStateProperty.all<Color>(
                            context.colors.primary9,
                          ),
                          overlayColor: WidgetStateProperty.all<Color>(
                            context.colors.primary9,
                          ),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),
                      ),
                      Text(
                        AppStrings.male,
                        style: context.typography.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: ResponsiveManager.isTablet ? 2.1 : 1.5,
                        child: Radio<GenderType>(
                          value: GenderType.female,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          fillColor: WidgetStateProperty.all<Color>(
                            context.colors.primary9,
                          ),
                          overlayColor: WidgetStateProperty.all<Color>(
                            context.colors.primary9,
                          ),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),
                      ),
                      Text(
                        AppStrings.female,
                        style: context.typography.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
