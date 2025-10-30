import 'dart:async';

import 'package:ecommerce_app/config/resources/app_animations.dart';
import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/config/storages/secure_storage.dart';
import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/intro/global/global_view_model/global_state.dart';
import 'package:ecommerce_app/features/intro/onboarding/on_boarding_local_data.dart';
import 'package:ecommerce_app/features/intro/splash/presentation/splash_view_model/splash_bloc.dart';
import 'package:ecommerce_app/features/intro/splash/presentation/splash_view_model/splash_state.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app_assets/app_assets.dart';
import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../../../../my_app/my_app.dart';
import '../../../global/global_view_model/global_bloc.dart';
import '../splash_view_model/splash_event.dart';

class SplashScreen extends StatefulWidget {
  final String? path;
  final String? id;
  const SplashScreen({super.key, this.path, this.id});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool onBoardingStatus = false;

  String appStoreVersion = "Default";
  String currentVersion = "current version";

  UserEntity? userData;

  bool _isExiting = false; // ✅ نتحكم بيها في أنيميشن الخروج

  @override
  void initState() {
    super.initState();
    _initializeLogic();
  }

  void _initializeLogic() {
    Future.delayed(const Duration(seconds: 2), () async {
      await _handleSplashLogic();
    });
  }

  Future<void> _handleSplashLogic() async {
    userData = await _getUserData();
    if (!mounted) return;

    if (!await _internetConnectionStatus()) return;

    onBoardingStatus = await _getOnBoardingStatus();

    if (!mounted) return;

    if (!onBoardingStatus) {
      _triggerExitAnimation(
        () => RouteManager.rPushNamedAndRemoveUntil(
          context: context,
          rName: AppRoutesNames.rOnBoardingScreen,
        ),
      );
      return;
    }

    if (await _checkLocalStoreToken()) {
      _checkUserTokenEvent();
    } else {
      _triggerExitAnimation(_goToLoginScreen);
    }
  }

  @override
  void didChangeDependencies() async {
    AppReference.getDeviceInfo(context);
    super.didChangeDependencies();
  }

  Future<bool> _internetConnectionStatus() async =>
      await getIt<NetworkInfo>().isConnected;

  Future<bool> _checkLocalStoreToken() async =>
      await getIt<BaseAppSecurityData>().getToken() != '';

  Future<bool> _getOnBoardingStatus() async =>
      await getIt<OnBoardingLocalData>().getOnBoardingValue();

  Future<UserEntity?> _getUserData() async =>
      getIt<UserLocalDataSource>().getUserData();

  void _checkUserTokenEvent() {
    if (mounted) {
      context.read<SplashBloc>().add(CheckUserTokenEvent());
    }
  }

  void _goToHomeScreen() =>
      Navigator.pushReplacementNamed(context, AppRoutesNames.rHomeLayoutView);

  void _goToLoginScreen() {
    navigatorKey.currentState!.pushReplacementNamed(
      AppRoutesNames.rLoginScreen,
    );
  }

  // ✅ دالة جديدة: تشغيل أنيميشن خروج ثم تنفيذ التنقل
  void _triggerExitAnimation(VoidCallback next) async {
    setState(() => _isExiting = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (mounted) next();
  }

  void _checkNextScreenAfterSplashFromDeepLink(bool isValidToken) {
    if (widget.path!.contains('/home') && isValidToken) {
      _triggerExitAnimation(
        () => navigatorKey.currentState!.pushReplacementNamed(
          AppRoutesNames.rHomeLayoutView,
        ),
      );
    } else if (widget.path!.contains('/coupons') && isValidToken) {
      // navigatorKey.currentState!.pushNamed(AppRoutesNames.rCouponsScreen);
    } else if (widget.path!.contains('/reviews') && isValidToken) {
      // navigatorKey.currentState!.pushNamed(AppRoutesNames.rReviewScreen);
    } else if (widget.path!.contains('/subscriptions') && widget.id != null) {
      // navigatorKey.currentState!.pushReplacementNamed(
      //   AppRoutesNames.rFreeSubscriptionsScreen,
      //   arguments: userData,
      // );
    } else {
      _triggerExitAnimation(
        () => navigatorKey.currentState!.pushReplacementNamed(
          AppRoutesNames.rLoginScreen,
        ),
      );
    }
  }

  void _checkNextScreenAfterSplash(bool isValidToken) {
    switch (isValidToken) {
      case true:
        if (userData == null) {
          _triggerExitAnimation(_goToLoginScreen);
        } else {
          _triggerExitAnimation(_goToHomeScreen);
        }
      case false:
        _triggerExitAnimation(_goToLoginScreen);
    }
  }

  // void _updateDialogOnTap({
  //   required String androidLink,
  //   required String iosLink,
  // }) {
  //   launchUrl(
  //     AppReference.deviceIsAndroid
  //         ? Uri.parse(androidLink)
  //         : Uri.parse(iosLink),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listener: (context, state) async {
            switch (state.checkTokenEventIsFinish) {
              case RequestStates.loaded:
                if (AppReference.userIsGuest()) {
                  _triggerExitAnimation(_goToLoginScreen);
                } else {
                  if (widget.path != null) {
                    _checkNextScreenAfterSplashFromDeepLink(state.isValidToken);
                  } else {
                    _checkNextScreenAfterSplash(state.isValidToken);
                  }
                }
              case RequestStates.error:
                _triggerExitAnimation(_goToLoginScreen);
              default:
            }
          },
        ),
      ],
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                // ✅ الخلفية بتظهر بنعومة من تحت
                Container(
                  decoration: BoxDecoration(color: context.colors.primary9),
                  height: AppReference.deviceHeight(context),
                  width: AppReference.deviceWidth(context),
                  child: SvgPicture.asset(
                    Assets.imagesBackground1,
                    fit: BoxFit.cover,
                    width: AppReference.deviceWidth(context),
                    height: AppReference.deviceHeight(context),
                  ),
                ).animateBottomToTop(
                  duration: const Duration(milliseconds: 1000),
                ),

                // ✅ اللوجو: دخول + خروج أنيميشن
                AnimatedOpacity(
                  opacity: _isExiting ? 0 : 1,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: AnimatedScale(
                    scale: _isExiting ? 0 : 1,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutBack,
                    child:
                        SvgPicture.asset(
                              Assets.projectIconSplashLogo,
                              width: Spacing.splashLogo,
                              height: Spacing.splashLogo,
                            )
                            .animateScaleNFadeVertical(
                              duration: const Duration(milliseconds: 1200),
                            )
                            .animateShimmer(),
                  ),
                ),
              ],
            ),
            /* : SizedBox.shrink() */
            //todo: uncomment it
          );
        },
      ),
    );
  }
}

// class _UpdateDialog extends StatelessWidget {
//   final Function(bool) onTap;
//   final bool canPop;
//   const _UpdateDialog({required this.onTap, required this.canPop});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: canPop,
//       child: ExitAndUpdateDialog(
//         title: AppStrings.updateAvailableTitle,
//         message: AppStrings.updateAvailableBody,
//         imagePath: Assets.iconsUpdate,
//         withImage: true,
//         titleColor: context.colors.primary9,
//         confirm: onTap,
//         isUpdateDialog: true,
//         requiredUpdate: canPop,
//       ),
//     );
//   }
// }
