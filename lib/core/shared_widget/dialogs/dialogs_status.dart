import 'package:ecommerce_app/core/responsive_manager/app_borders.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../my_app/app_reference.dart';
import '../../enum/enum_generation.dart';
import '../../responsive_manager/app_padding.dart';
import '../buttons/button_widget.dart';

void showStatusDialog({
  required BuildContext context,
  required String message,
  required ToastStates state,
}) => showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) =>
      DialogsStatus(state: state, message: message),
);

class DialogsStatus extends StatefulWidget {
  final ToastStates state;
  final String message;

  const DialogsStatus({super.key, required this.state, required this.message});

  @override
  State<DialogsStatus> createState() => _DialogsStatusState();
}

class _DialogsStatusState extends State<DialogsStatus> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      elevation: 5,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      content: Container(
        height: !AppReference.isPortrait(context)
            ? AppReference.deviceHeight(context) * .75
            : AppReference.deviceHeight(context) * 0.36,
        width: !AppReference.isPortrait(context)
            ? AppReference.deviceWidth(context) * 0.45
            : AppReference.deviceWidth(context) * 0.8,
        padding: EdgeInsets.all(AppPadding.screenPaddingP24),
        constraints: BoxConstraints(
          minHeight: AppReference.deviceHeight(context) * 0.26,
          maxHeight: AppReference.deviceHeight(context) * 0.75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              _imagePath(widget.state),
              height: AppReference.deviceHeight(context) * 0.15,
            ),
            //    AppSize.s4,
            Text(_title(widget.state), style: context.typography.titleMedium),
            //   AppSize.s4.sizedBoxHeight,
            Text(
              widget.message,
              style: context.typography.labelLarge.copyWith(
                color: context.colors.primary4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            SizedBox(
              width: AppReference.deviceWidth(context) * 0.6,
              child: DefaultButtonWidget(
                // elevation: 0,
                label: 'حسنا',
                height: Spacing.s50,
                buttonColor: _chooseToastPrimaryColor(widget.state),
                borderColor: Colors.transparent,
                textVerticalPadding: !AppReference.isPortrait(context) ? 6 : 0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _imagePath(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return Assets.imagesSuccussDialog;
      case ToastStates.error:
        return Assets.imagesFailedDialog;
      case ToastStates.warning:
        return Assets.imagesWarningDialog;
      case ToastStates.info:
        return Assets.imagesSuccussDialog;
    }
  }

  String _title(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return "مبرووووك !";
      case ToastStates.error:
        return "نأسف !";
      case ToastStates.warning:
        return "تنويه!";
      case ToastStates.info:
        return "عملية ناجحة !";
    }
  }

  Color _chooseToastPrimaryColor(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return context.colors.green.withOpacity(.2);
      case ToastStates.error:
        return context.colors.red.withOpacity(.2);
      case ToastStates.warning:
        return context.colors.primary7.withOpacity(.2);
      case ToastStates.info:
        return context.colors.primary5.withOpacity(.2);
    }
  }

  Color _chooseToastSecondaryColor(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return context.colors.green;
      case ToastStates.error:
        return context.colors.red;
      case ToastStates.warning:
        return context.colors.primary7;
      case ToastStates.info:
        return context.colors.primary5;
    }
  }
}
