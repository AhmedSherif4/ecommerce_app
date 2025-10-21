import 'package:ecommerce_app/config/resources/app_animations.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/base_widgets/snackbar_widget.dart';
import 'package:ecommerce_app/core/shared_widget/buttons/button_widget.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../app_assets/app_assets.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../my_app/app_reference.dart';
import '../get_social_data_view_model/get_social_data_bloc.dart';
import '../get_social_data_view_model/get_social_data_event.dart';
import '../get_social_data_view_model/get_social_data_state.dart';

class GetSocialView extends StatelessWidget {
  const GetSocialView({super.key});

  _getGoogleID(context) async {
    BlocProvider.of<GetSocialDataBloc>(context).add(GetGoogleDataEvent());
  }

  _getAppleID(context) async {
    BlocProvider.of<GetSocialDataBloc>(context).add(GetAppleDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetSocialDataBloc>(),
      child: Builder(
        builder: (buildCtx) {
          return BlocListener<GetSocialDataBloc, GetSocialDataState>(
            listener: (_, state) {
              if (state.getGoogleDataState == RequestStates.loaded ||
                  state.getAppleDataState == RequestStates.loaded) {
                if (state.isCompletedProfile) {
                  RouteManager.rPushReplacementNamed(
                    context: context,
                    rName: AppRoutesNames.rHomeLayoutView,
                  );
                } else {
                  RouteManager.rPushNamed(
                    context: context,
                    rName: AppRoutesNames.rCompleteProfileScreen,
                    arguments: state.user,
                  );
                }
                showSnackBar(
                  state: ToastStates.congrats,
                  description: state.loginMessage,
                  context: context,
                );
              }
              if (state.getGoogleDataState == RequestStates.error ||
                  state.getAppleDataState == RequestStates.error) {
                showSnackBar(
                  state: ToastStates.error,
                  description: state.loginMessage,
                  context: context,
                );
              }
            },
            child: AppReference.deviceIsIos
                ? SignInWithAppleButton(
                    text: AppStrings.loginWithApple,
                    onPressed: () async {
                      _getAppleID(buildCtx);
                    },
                  )
                : DefaultButtonWidget(
                    buttonColor: context.colors.primary0,
                    textColor: context.colors.primary9,
                    label: AppStrings.loginWithGoogle,
                    frontIcon: Assets.projectIconLogosGoogleIcon,
                    onPressed: () async {
                      _getGoogleID(buildCtx);
                    },
                  ),
          );
        },
      ),
    ).animateShimmer();
  }
}
