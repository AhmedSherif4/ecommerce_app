import 'package:flutter/material.dart';

import '../custom_inkwell.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final TextStyle style;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(text, style: style),
      ),
    );
  }
}
