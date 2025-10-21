import 'package:flutter/material.dart';

/// Reference design dimensions

/// Supported device types
enum DeviceType { mobile, tablet }

/// Manages responsive sizing and device type detection.
class ResponsiveManager {
  static const double _designWidthMobile = 390;
  static const double _designHeightMobile = 844;
  static const double _designWidthTablet = 768;
  static const double _designHeightTablet = 1024;

  static late double _screenWidth;
  static late double _screenHeight;
  static late DeviceType _deviceType;
  static late bool _isLandscape;
  static late bool isTablet;

  /// Initializes the manager from context
  static void init(BuildContext context) {
    try {
      final mq = MediaQuery.of(context);
      _screenWidth = mq.size.width;
      _screenHeight = mq.size.height;
      _isLandscape = mq.orientation == Orientation.landscape;
      print(
        'Screen Width: $_screenWidth, Screen Height: $_screenHeight, Orientation: ${mq.orientation}',
      );

      if (_screenWidth >= 600) {
        isTablet = true;
        _deviceType = DeviceType.tablet;
      } else {
        isTablet = false;
        _deviceType = DeviceType.mobile;
      }
    } catch (_) {
      _screenWidth = _designWidthMobile;
      _screenHeight = _designHeightMobile;

      _deviceType = DeviceType.mobile;
      _isLandscape = false;
    }
  }

  static DeviceType get deviceType => _deviceType;
  static bool get isLandscape => _isLandscape;

  static double w(double px) {
    final baseWidth = _deviceType == DeviceType.tablet
        ? _designWidthTablet
        : _designWidthMobile;
    return px * (_screenWidth / baseWidth);
  }

  static double h(double px) {
    final baseHeight = _deviceType == DeviceType.tablet
        ? _designHeightTablet
        : _designHeightMobile;
    return px * (_screenHeight / baseHeight);
  }

  static double f(double px) {
    final baseWidth = _deviceType == DeviceType.tablet
        ? _designWidthTablet
        : _designWidthMobile;
    return px * (_screenWidth / baseWidth);
  }

  static double r(double px) {
    final baseWidth = _deviceType == DeviceType.tablet
        ? _designWidthTablet
        : _designWidthMobile;
    return px * (_screenWidth / baseWidth);
  }
}
