import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

class CircleCheckBoxWidget extends StatelessWidget {
  final bool isSelected;
  final Function(bool?) onChange;
  const CircleCheckBoxWidget({
    super.key,
    required this.isSelected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        side: const BorderSide(color: Colors.grey, width: 2),
        value: isSelected,
        checkColor: Colors.white,
        activeColor: context.colors.primary4,
        visualDensity: VisualDensity.standard,
        // shape: const OutlinedBorder(),
        onChanged: onChange,
      ),
    );
  }
}
