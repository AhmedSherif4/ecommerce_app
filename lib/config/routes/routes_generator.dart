import 'package:ecommerce_app/features/auth/forget_password/forget_password.dart';
import 'package:ecommerce_app/features/checkout/checkout.dart';
import 'package:ecommerce_app/features/help_center/help_center.dart';
import 'package:ecommerce_app/features/home_layout/home_layout.dart';
import 'package:ecommerce_app/features/intro/onboarding/on_boarding_screen.dart';
import 'package:ecommerce_app/features/intro/splash/presentation/view/splash_screen.dart';
import 'package:ecommerce_app/features/saved/saved.dart';
import 'package:ecommerce_app/features/shared_features/notification/presentation/view/notification_screen.dart';
import 'package:ecommerce_app/features/shared_features/notification/presentation/view_model/notification_bloc.dart';
import 'package:ecommerce_app/features/shared_features/profile/edit_profile/presentation/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../core/shared_models/product/product_model.dart';
import '../../core/shared_models/user/user_entity/user_entity.dart';
import '../../features/address/address.dart';
import '../../features/auth/complete_profile_screen/complete_profile_screen.dart';
import '../../features/auth/complete_profile_screen/social_register_view_model/social_register_bloc.dart';
import '../../features/auth/login/login.dart';
import '../../features/auth/login/presentation/login_screen/login_screen.dart';
import '../../features/auth/sign_up/presentation/sign_up_screen.dart';
import '../../features/auth/sign_up/sign_up.dart';
import '../../features/auth/verification/verification.dart';
import '../../features/details_product/details_product.dart';
import '../../features/faqs/faqs.dart';
import '../../features/home/view_model/home_bloc.dart';
import '../../features/my_orders/my_orders.dart';
import '../../features/payment/payment.dart';
import '../../features/search/search.dart';
import '../../features/shared_features/contact_us/presentations/view_model/contact_us_bloc.dart';
import '../../features/shared_features/notification/presentation/view/notification_manager_screen.dart';
import '../../features/shared_features/profile/edit_profile/edit_profile.dart';
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
              BlocProvider(create: (context) => getIt<HomeLayoutBloc>()),
              BlocProvider(
                create: (context) => getIt<HomeBloc>()
                  ..add(const GetAllCategoriesEvent())
                  ..add(
                    const GetAllProductsEvent(
                      getAllProductsRequest: GetAllProductsRequest(),
                    ),
                  ),
              ),
              BlocProvider(create: (context) => getIt<SearchCubit>()),
              BlocProvider(
                create: (context) => getIt<SavedCubit>()..getAllFavourites(),
              ),
              BlocProvider(create: (context) => getIt<PaymentBloc>()),

              // ..add(
              //   CheckChildIsSubscribedEvent(
              //     childId: getIt<UserLocalDataSource>()
              //         .getUserData()!
              //         .userId,
              //   ),
              // )
            ],
            child: const HomeLayoutView(),
          ),
        );

      case AppRoutesNames.rNotificationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NotificationBloc>(),
            /*..add(const GetAllNotificationEvent(pageNumber: 1))*/
            child: const NotificationScreen(),
          ),
        );
      case AppRoutesNames.rNotificationManagerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<NotificationBloc>(),
            child: const NotificationManagerScreen(),
          ),
        );
      case AppRoutesNames.rDetailsProductScreen:
        ProductModel product = settings.arguments as ProductModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DetailsProductCubit>(),
            child: DetailsProductScreen(product),
          ),
        );
      case AppRoutesNames.rCheckoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CheckoutCubit>(),
            child: const CheckoutScreen(),
          ),
        );
      case AppRoutesNames.rPaymentMethodsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CheckoutCubit>(),
            child: const PaymentMethodScreen(),
          ),
        );
      case AppRoutesNames.rAddressScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddressCubit>()..loadAddresses(),
            child: const AddressScreen(),
          ),
        );
      case AppRoutesNames.rMyOrdersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MyOrdersCubit>(),
            child: const MyOrdersScreen(),
          ),
        );
      case AppRoutesNames.rProfileDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileBloc>(),
            child: const ProfileDetailsScreen(),
          ),
        );
      case AppRoutesNames.rEditProfileScreen:
        final DataToGoToEditProfileScreen data =
            settings.arguments as DataToGoToEditProfileScreen;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileBloc>(),
            child: EditProfileScreen(data: data),
          ),
        );
      case AppRoutesNames.rChangePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileBloc>(),
            child: const ChangePasswordScreen(),
          ),
        );
      case AppRoutesNames.rFaqsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FaqsCubit>(),
            child: const FaqsScreen(),
          ),
        );
      case AppRoutesNames.rHelpCenterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HelpCenterCubit>(),
            child: const HelpCenterScreen(),
          ),
        );

      case AppRoutesNames.rSearchScreen:
        String value = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SearchScreen(value: value));
      default:
        return unDefinedRoute();
    }
  }
}
