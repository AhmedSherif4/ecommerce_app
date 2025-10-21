import 'package:flutter/material.dart';

import '../../config/resources/app_constants.dart';

class TextWithBackGroundColor extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? textColor;
  final bool isOneLine;
  final double fontSize;
  final int? maxLine;

  const TextWithBackGroundColor({
    super.key,
    required this.text,
    this.width,
    this.height,
    required this.backgroundColor,
    this.verticalPadding = 10,
    this.horizontalPadding = 10,
    this.textColor,
    this.isOneLine = false,
    this.fontSize = 18,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR25),
      ),
      child: isOneLine
          ? FittedBox(child: Text(text, textAlign: TextAlign.center))
          : SingleChildScrollView(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: maxLine,
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}
