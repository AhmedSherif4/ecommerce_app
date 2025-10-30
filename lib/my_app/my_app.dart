import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/config/routes/routes_generator.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/theme_manager/domain/i_theme_repository.dart';
import 'package:ecommerce_app/features/intro/global/global_view_model/global_bloc.dart';
import 'package:ecommerce_app/my_app/notification/i_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/resources/app_strings.dart';
import '../core/responsive_manager/responsive_context.dart';
import '../core/responsive_manager/responsive_manager.dart';
import '../core/theme_manager/factory/app_theme_factory.dart';
import '../core/theme_manager/theme_bloc/theme_bloc.dart';
import '../core/theme_manager/theme_bloc/theme_event.dart';
import '../core/theme_manager/theme_bloc/theme_state.dart';
import 'app_requirement_setup.dart';
import 'deep_link_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late IAppThemeFactory _themeFactory;

  @override
  void initState() {
    super.initState();
    DeepLinkManager.instance.initDeepLink();

    Future.delayed(const Duration(seconds: 0), () async {
      AppRequirementSetup.registerHiveAdapter();
      await AppRequirementSetup.initialFutures();
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    ResponsiveManager.init(context);
    _themeFactory = getIt<IAppThemeFactory>();

    SpacingContext.init(ResponsiveManager.deviceType);
    getIt<IThemeRepository>().getLocale().then((locale) {
      if (mounted) return context.setLocale(locale);
    });
    await getIt<INotificationService>().subscribeToTopic('all');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => getIt<ThemeBloc>()..add(LoadFromStorage()),
        ),
        BlocProvider(
          create: (context) => getIt<GlobalBloc>(),
          //todo: uncomment these lines if you want to fetch app info and version on app start
          /*..add(GetInfoDataEvent())
            ..add(CheckAppVersionEvent())*/
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: _themeFactory.buildTheme(
              context: context,
              isDark: state.isDark,
            ),
            darkTheme: _themeFactory.buildTheme(
              context: context,
              isDark: state.isDark,
            ),
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            navigatorObservers: [routeObserver],
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            onGenerateRoute: AppRouteGenerator.onGenerateRoute,
            initialRoute: AppRoutesNames.rSplashScreen,
            // home:MoreScreen()
          );
        },
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
