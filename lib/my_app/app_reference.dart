import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import '../config/storages/keys.dart';
import '../core/base_widgets/snackbar_widget.dart';
import '../core/enum/enum_generation.dart';
import '../core/services/services_locator.dart';
import '../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';

class AppReference {
  AppReference._();

  static final AppReference _instance = AppReference._();

  static AppReference get instance => _instance;

  static late bool deviceIsAndroid;
  static bool deviceIsTablet = false;
  static late bool deviceIsIos;

  static final deviceInfoPlugin = DeviceInfoPlugin();

  static String countryCode = "+966";

  static Orientation currentOrientation(context) =>
      MediaQuery.of(context).orientation;

  static bool isPortrait(context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static double deviceHeight(context) => MediaQuery.sizeOf(context).height;

  static double deviceWidth(context) => MediaQuery.sizeOf(context).width;

  static void getDeviceInfo(BuildContext context) {
    final sizeMediaQuery = MediaQuery.sizeOf(context);

    deviceIsAndroid = Platform.isAndroid;

    deviceIsIos = Platform.isIOS;
    final double devicePixelRatio = sizeMediaQuery.shortestSide;
    if (devicePixelRatio < 550) {
      deviceIsTablet = false;
    } else {
      deviceIsTablet = true;
    }
  }

  static Future<String> getMobileID() async {
    if (deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else {
      final keyExit = await getIt<FlutterSecureStorage>().containsKey(
        key: AppKeys.iosDeviceID,
      );
      if (keyExit) {
        final iosDeviceId = await getIt<FlutterSecureStorage>().read(
          key: AppKeys.iosDeviceID,
        );
        return iosDeviceId!;
      } else {
        final iosDeviceId = Uuid().v4();
        await getIt<FlutterSecureStorage>().write(
          key: AppKeys.iosDeviceID,
          value: iosDeviceId,
          iOptions: IOSOptions(
            //    accessibility: KeychainAccessibility.first_unlock,
          ),
        );
        return iosDeviceId;
      }
    }
  }

  static Future<bool> isHuaweiDevice() async {
    if (AppReference.deviceIsAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.manufacturer.toLowerCase().contains('huawei')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<bool> isAndroid13AndNewer() async {
    if (deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static bool userIsGuest() {
    //todo: handle this guest user.
    if (getIt<UserLocalDataSource>().getUserData() != null &&
        getIt<UserLocalDataSource>().getUserData()!.email == 'guest@mail.com') {
      return true;
    } else {
      return false;
    }
  }

  static void guestDialogMustLogin(context) {
    showSnackBarWithAction(
      description: 'يجب تسجيل الدخول أولا',
      state: ToastStates.warning,
      context: context,
      actionIcon: Icons.local_hospital_outlined,
      actionLabel: 'تسجيل',
      onPressed: () {
        // RouteManager.rPushNamedAndRemoveUntil(
        //     context: context, rName: AppRoutesNames.rWelcome);
      },
    );
    // showSnackBar(description: 'يجب تسجيل الدخول أولا', state: ToastStates.warning, context: context);
  }

  // static bool isProtection(context){
  //  // bool isProtection = context.read<GlobalBloc>().state.appVersionModel.appRepairing;
  // //  return isProtection;
  // }

  static StringType detectStringType(String input) {
    bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(input);
    bool isEnglish = RegExp(r'[A-Za-z]').hasMatch(input);

    if (isArabic && isEnglish) {
      return StringType.unknown;
    } else if (isArabic) {
      if (isQuranicArabic(input)) {
        return StringType.quranicArabic;
      }
      return StringType.arabic;
    } else if (isEnglish) {
      return StringType.english;
    } else {
      return StringType.unknown;
    }
  }

  static bool isQuranicArabic(String input) {
    return RegExp(r'[\u0610-\u061A\u064B-\u065F]').hasMatch(input);
  }

  // static String formatSaudiNumber(String phoneNumber) {
  //   final RegExp saudiNumberRegExp = RegExp(r'^(?:\+9660?|00966|009660?|9660?|0)?5(\d{8})$');
  //   final match = saudiNumberRegExp.firstMatch(phoneNumber);
  //
  //   if (match != null) {
  //     // Extract the last 8 digits and prepend with '05'
  //     return '05${match.group(1)}';
  //   } else {
  //     return "Invalid number";
  //   }
  // }

  static String formatPhoneNumber(String phoneNumber) {
    if (countryCode == '+966') {
      // Saudi Arabia format
      final RegExp saudiNumberRegExp = RegExp(
        r'^(?:\+9660?|00966|009660?|9660?|0)?5(\d{8})$',
      );
      final match = saudiNumberRegExp.firstMatch(phoneNumber);

      if (match != null) {
        // return '05${match.group(1)}'; // Standardize to '05xxxxxxxx'
        return '5${match.group(1)}'; // Standardize to '05xxxxxxxx'
      } else {
        return "Invalid Saudi number";
      }
    } else if (countryCode == '+20') {
      // Egypt format
      final RegExp egyptianNumberRegExp = RegExp(
        r'^(?:\+201|01|1)?([0-2,5]{1}\d{8})$',
      );
      final match = egyptianNumberRegExp.firstMatch(phoneNumber);

      if (match != null) {
        return '01${match.group(1)}'; // Standardize to '01xxxxxxxxx'
      } else {
        return "Invalid Egyptian number";
      }
    } else {
      return "Unsupported country code";
    }
  }
}
