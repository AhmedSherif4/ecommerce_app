import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/theme_manager/localization_logic/localization_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/bloc/bloc_observer.dart';
import 'config/storages/keys.dart';
import 'core/services/services_locator.dart';
import 'firebase_options.dart';
import 'my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    // settings => Data API
    url: 'https://ucyrylmtzpvglhqeztpn.supabase.co',

    // settings => API Key
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVjeXJ5bG10enB2Z2xocWV6dHBuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg5NzM2NzQsImV4cCI6MjA3NDU0OTY3NH0.b2z88RMbCwM_nujGMlteljohzXtJyWafQ7s7jaHmuzo',
  );
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  configureDependencies();
  await Hive.openBox(AppKeys.keyDark);
  await Hive.openBox(AppKeys.keyLocale);

  runApp(
    EasyLocalization(
      supportedLocales: const [englishLocale, arabicLocale],
      path: assetPathLocalization,
      // phoenix for restart app when we change the language
      //! for Localization
      child: Phoenix(child: const MyApp()),
    ),
  );

  Bloc.observer = MyBlocObserver();
}

/*
Variant: debug
Config: debug
Store: C:\Users\Ahmed\.android\debug.keystore
Alias: AndroidDebugKey
MD5: BD:A3:6A:C6:A8:58:96:DD:22:27:15:62:46:CA:51:AE
SHA1: DD:28:3C:53:71:9F:9A:6E:82:09:18:20:00:73:3E:B5:4A:D0:33:2A
SHA-256: DF:CF:9B:87:20:36:AA:F7:8A:BD:E3:D7:55:EB:D7:89:78:5E:56:CC:6B:B0:A7:6A:D6:13:31:BC:4D:88:02:B0
Valid until: Sunday, March 15, 2054 */

// line for generating
// flutter pub run build_runner watch --delete-conflicting-outputs
