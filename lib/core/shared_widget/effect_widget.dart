import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:flutter/material.dart';

import 'glass_background_widget.dart';

class EffectWidget extends StatelessWidget {
  final Widget headerChild;
  final Widget bodyChild;
  final double heightFromDeviceHeight;

  const EffectWidget({
    super.key,
    required this.headerChild,
    required this.bodyChild,
    required this.heightFromDeviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFromDeviceHeight,
      child: Stack(
        children: [
          Container(
            height: heightFromDeviceHeight * 0.8,
            constraints: BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).width,
            ),
            decoration: BoxDecoration(
              color: Color(0xffF15A22),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppBorders.appBorderWidthR30),
                bottomRight: Radius.circular(AppBorders.appBorderWidthR30),
              ),
            ),
            child: headerChild,
          ),

          Positioned(
            left: AppPadding.screenPaddingP24,
            right: AppPadding.screenPaddingP24,
            top: heightFromDeviceHeight / 2,
            child: GlassBackgroundWidget(
              heightFromDeviceHeight: heightFromDeviceHeight,
              bodyChild: bodyChild,
            ),
          ),
        ],
      ),
    );
  }
}
