import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/theme_manager/localization_logic/localization_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/bloc/bloc_observer.dart';
import 'config/storages/keys.dart';
import 'core/services/services_locator.dart';
import 'firebase_options.dart';
import 'my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "assets/.env");
  await Hive.initFlutter();
  configureDependencies();
  await Hive.openBox(AppKeys.keyLocale);
  await Hive.openBox(AppKeys.keyDark);

  runApp(
    EasyLocalization(
      supportedLocales: const [englishLocale, arabicLocale],
      path: assetPathLocalization,
      child: Phoenix(child: const MyApp()),
    ),
  );

  Bloc.observer = MyBlocObserver();
}
