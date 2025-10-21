import 'package:ecommerce_app/features/auth/forget_password/forget_password.dart';
import 'package:ecommerce_app/features/home_layout/home_layout.dart';
import 'package:ecommerce_app/features/intro/onboarding/on_boarding_screen.dart';
import 'package:ecommerce_app/features/intro/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../core/shared_models/user/user_entity/user_entity.dart';
import '../../features/auth/complete_profile_screen/complete_profile_screen.dart';
import '../../features/auth/complete_profile_screen/social_register_view_model/social_register_bloc.dart';
import '../../features/auth/login/login.dart';
import '../../features/auth/login/presentation/login_screen/login_screen.dart';
import '../../features/auth/sign_up/presentation/sign_up_screen.dart';
import '../../features/auth/sign_up/sign_up.dart';
import '../../features/auth/verification/verification.dart';
import '../../features/shared_features/contact_us/presentations/view_model/contact_us_bloc.dart';
import 'routes_names.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.rSplashScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const SplashScreen();
          },
        );

      case AppRoutesNames.rForgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordBloc>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case AppRoutesNames.rOnBoardingScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const OnboardingScreen();
          },
        );

      case AppRoutesNames.rLoginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<LoginBloc>()),
              BlocProvider(
                create: (context) =>
                    getIt<ContactUsBloc>() /*..add(GetContactUsEvent())*/,
              ), //todo uncomment it
            ],
            child: const LoginScreen(),
          ),
        );

      case AppRoutesNames.rVerificationScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerificationBloc>(),
            child: VerificationScreen(arguments: arguments),
          ),
        );

      case AppRoutesNames.rCompleteProfileScreen:
        UserEntity user = settings.arguments as UserEntity;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SocialRegisterBloc>(),
            child: CompleteProfileScreen(user: user),
          ),
        );

      case AppRoutesNames.rSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignUpBloc>()),
              BlocProvider(create: (context) => getIt<LoginBloc>()),
              BlocProvider(create: (context) => getIt<VerificationBloc>()),
              BlocProvider(
                create: (context) =>
                    getIt<
                      ContactUsBloc
                    >() /*..add(GetContactUsEvent())*/, //todo uncomment it
              ),
            ],
            child: const SignUpScreen(),
          ),
        );

      case AppRoutesNames.rHomeLayoutView:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<HomeLayoutBloc>(),
                // ..add(
                //   CheckChildIsSubscribedEvent(
                //     childId: getIt<UserLocalDataSource>()
                //         .getUserData()!
                //         .userId,
                //   ),
                // )
              ),
              //   BlocProvider(
              //     create: (context) =>
              //         getIt<NotificationBloc>()
              //           ..add(const GetAllNotificationEvent(pageNumber: 1)),
              //   ),
            ],
            child: const HomeLayoutView(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }
}
