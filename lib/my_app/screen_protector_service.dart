// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:screen_protector/screen_protector.dart';
//
// class ScreenProtectorService {
//   // Private constructor for the singleton pattern
//   ScreenProtectorService._init();
//
//   // Singleton instance
//   static final ScreenProtectorService _instance =
//       ScreenProtectorService._init();
//
//   // Getter to access the singleton instance
//   static ScreenProtectorService get instance => _instance;
//
//   final bool _isProtectionEnabled = false;
//
//   /// Enable screen protection
//   Future<void> enableScreenProtection(BuildContext context) async {
//     if (false) {
//       try {
//         await ScreenProtector.preventScreenshotOn();
//         if (Platform.isIOS) {
//           await ScreenProtector.protectDataLeakageOn();
//         }
//       } catch (e) {
//         throw ('Failed to enable screenshot protection: $e');
//       }
//     }
//   }
//
//   /// Disable screen protection
//   Future<void> disableScreenProtection() async {
//     try {
//       await ScreenProtector.preventScreenshotOff();
//       if (Platform.isIOS) {
//         ScreenProtector.protectDataLeakageOff();
//       }
//     } catch (e) {
//       throw ('Failed to disable screenshot protection: $e');
//     }
//   }
// }
