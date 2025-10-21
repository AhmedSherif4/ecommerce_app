import 'package:app_links/app_links.dart';
import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:flutter/material.dart';

import '../features/intro/splash/presentation/view/splash_screen.dart';
import 'my_app.dart';

class DeepLinkManager {
  DeepLinkManager._privateConstructor();

  static final DeepLinkManager _instance =
      DeepLinkManager._privateConstructor();

  static DeepLinkManager get instance => _instance;

  late AppLinks _appLinks;
  void initDeepLink() async {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri uri) async {
      final path = uri.path;
      final id = uri.queryParameters['id'];
      'at deep link manager'.log();
      uri.log();
      path.log();
      id.log();

      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen(path: path, id: id),
        ),
      );
    });
  }
}
