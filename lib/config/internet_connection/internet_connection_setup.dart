import 'dart:ui' as ui;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/responsive_manager/spacing_facade.dart';
import '../routes/route_manager.dart';
import '../routes/routes_names.dart';

class ConnectivityController {
  final Connectivity _connectivity = Connectivity();
  ValueNotifier<bool> isConnected = ValueNotifier(false);
  Future<void> init() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    isInternetConnected(result);
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      isInternetConnected(result);
    });
  }

  bool isInternetConnected(List<ConnectivityResult?> result) {
    if (result.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}

class ConnectionAlert extends StatefulWidget {
  const ConnectionAlert({super.key});
  @override
  State<ConnectionAlert> createState() => _ConnectionAlertState();
}

class _ConnectionAlertState extends State<ConnectionAlert> {
  ConnectivityController connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: connectivityController.isConnected,
      builder: (context, value, child) {
        if (value) {
          return const SizedBox.shrink();
        } else {
          return const _NetworkAlertBar();
        }
      },
    );
  }
}

class SplashConnectionAlert extends StatefulWidget {
  const SplashConnectionAlert({super.key});
  @override
  State<SplashConnectionAlert> createState() => _SplashConnectionAlertState();
}

class _SplashConnectionAlertState extends State<SplashConnectionAlert> {
  ConnectivityController connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController._connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        if (mounted) {
          RouteManager.rPushNamedAndRemoveUntil(
            context: context,
            rName: AppRoutesNames.rSplashScreen,
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _NetworkAlertBar extends StatelessWidget {
  const _NetworkAlertBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: context.colors.red,
        height: Spacing.s50,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.screenPaddingP24,
          ),
          child: Row(
            textDirection: ui.TextDirection.rtl,
            children: [
              Icon(
                Icons.error,
                color: context.colors.primary0,
                textDirection: ui.TextDirection.rtl,
              ),
              //     AppSize.s10,
              Text(
                "لا يوجد اتصال بالانترنت",
                textDirection: ui.TextDirection.rtl,
                style: context.typography.bodyLarge.copyWith(
                  color: context.colors.primary9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
