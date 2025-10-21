import 'dart:async';

import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/config/storages/secure_storage.dart';
import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:ecommerce_app/core/base_widgets/snackbar_widget.dart';
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
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double opacity = 0;
  bool value = true;
  bool onBoardingStatus = false;
  // final newVersion=NewVersionPlus(
  //   androidId: "com.edu_tasses.ecommerce_app",
  // );
  String appStoreVersion = "Default";
  String currentVersion = "current version";

  UserEntity? userData;

  @override
  void initState() {
    super.initState();
    scaleController =
        AnimationController(
          vsync: this,
          duration: const Duration(seconds: 2),
        )..addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            // final updateService = AppUpdateService(
            //   androidPackageId:
            //       'com.example.ecommerce_app', // ✅ استبدلها بالـ Android package ID الخاص بتطبيقك
            //   iosBundleId:
            //       'com.example.ecommerceApp', // ✅ استبدلها بالـ iOS bundle ID الخاص بتطبيقك
            // );
            // check Update Here
            // if (await updateService.isUpdateAvailable()) {
            // if (false) {
            //   if (mounted) {
            //     showDialog(
            //       context: context,
            //       barrierDismissible: false,
            //       builder: (_) => _UpdateDialog(
            //         onTap: (value) {
            //           _updateDialogOnTap(
            //             androidLink: BlocProvider.of<GlobalBloc>(
            //               context,
            //             ).state.appVersionModel.androidLink,
            //             iosLink: BlocProvider.of<GlobalBloc>(
            //               context,
            //             ).state.appVersionModel.iosLink,
            //           );
            //         },
            //         canPop: false,
            //       ),
            //     );
            //   }
            // } else {
            userData = await _getUserData();
            if (mounted && await _internetConnectionStatus()) {
              onBoardingStatus = await _getOnBoardingStatus();

              if (!onBoardingStatus && mounted) {
                RouteManager.rPushNamedAndRemoveUntil(
                  context: context,
                  rName: AppRoutesNames.rOnBoardingScreen,
                );
              } else if (await _checkLocalStoreToken()) {
                _checkUserTokenEvent();
              } else {
                _goToLoginScreen();
              }
            }
            // }
          }
        });

    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 12,
    ).animate(scaleController);

    Timer(const Duration(seconds: 1), () {
      if (context.mounted) {
        setState(() {
          opacity = 1.0;
          value = false;
        });
      }
    });
    Timer(const Duration(seconds: 1), () {
      if (context.mounted) {
        setState(() {
          scaleController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    AppReference.getDeviceInfo(context);

    super.didChangeDependencies();
  }

  Future<bool> _internetConnectionStatus() async {
    return await getIt<NetworkInfo>().isConnected;
  }

  Future<bool> _checkLocalStoreToken() async {
    return await getIt<BaseAppSecurityData>().getToken() != '';
  }

  Future<bool> _getOnBoardingStatus() async {
    return await getIt<OnBoardingLocalData>().getOnBoardingValue();
  }

  Future<UserEntity?> _getUserData() async {
    return getIt<UserLocalDataSource>().getUserData();
  }

  void _checkUserTokenEvent() {
    if (mounted) {
      context.read<SplashBloc>().add(CheckUserTokenEvent());
    }
  }

  void _goToHomeScreen() {
    Navigator.pushReplacementNamed(context, AppRoutesNames.rHomeLayoutView);
  }

  void _goToLoginScreen() {
    navigatorKey.currentState!.pushReplacementNamed(
      AppRoutesNames.rLoginScreen,
    );
  }

  void _checkNextScreenAfterSplashFromDeepLink(bool isValidToken) {
    if (widget.path!.contains('/home') && isValidToken) {
      navigatorKey.currentState!.pushReplacementNamed(
        AppRoutesNames.rHomeLayoutView,
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
      navigatorKey.currentState!.pushReplacementNamed(
        AppRoutesNames.rLoginScreen,
      );
    }
  }

  void _checkNextScreenAfterSplash(bool isValidToken) {
    switch (isValidToken) {
      case true:
        if (userData == null) {
          _goToLoginScreen();
        } else {
          _goToHomeScreen();
        }
      case false:
        _goToLoginScreen();
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
                  _goToLoginScreen();
                } else {
                  if (widget.path != null) {
                    _checkNextScreenAfterSplashFromDeepLink(state.isValidToken);
                  } else {
                    _checkNextScreenAfterSplash(state.isValidToken);
                  }
                }
              case RequestStates.error:
                showSnackBar(
                  description: state.checkTokenErrorMessage,
                  state: ToastStates.error,
                  context: context,
                );
                _goToLoginScreen();
              default:
            }
          },
        ),
      ],
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return Scaffold(
            body: /* state.checkAppVersionState == RequestStates.loaded
                ?  */ Stack(
              alignment: AlignmentGeometry.center,
              children: [
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
                ),
                SizedBox(
                  child: SvgPicture.asset(
                    Assets.projectIconSplashLogo,
                    // fit: BoxFit.contain,
                    width: Spacing.splashLogo,
                    height: Spacing.splashLogo,
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
