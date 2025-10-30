import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/text_styling/tokens/app_font_weights.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/auth/login/presentation/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/resources/app_strings.dart';
import '../../../../../config/routes/route_manager.dart';
import '../../../../../config/routes/routes_names.dart';
import '../../../../../config/storages/secure_storage.dart';
import '../../../../../core/base_widgets/loading_shimmer_widget.dart';
import '../../../../../core/base_widgets/loading_widget.dart';
import '../../../../../core/base_widgets/snackbar_widget.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/shared_widget/app_input_field/email_filed.dart';
import '../../../../../core/shared_widget/app_input_field/password_filed.dart';
import '../../../../../core/shared_widget/buttons/button_widget.dart';
import '../../../../../core/shared_widget/buttons/text_button_widget.dart';
import '../../../../../core/shared_widget/dialogs/dialogs_status.dart';
import '../../../../../core/shared_widget/divider_or_widget.dart';
import '../../../../../my_app/app_reference.dart';
import '../../../../intro/global/global_view_model/global_bloc.dart';
import '../../../../intro/global/global_view_model/global_event.dart';
import '../../../../intro/global/global_view_model/global_state.dart';
import '../../../../shared_features/get_social_data/presentation/get_social_view/get_social_view.dart';
import '../../login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.loginStates) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            Navigator.of(context).pop();
            _checkChildIsBlockedOrNot(state.loginMessage);
          case RequestStates.error:
            Navigator.of(context).pop();
            showSnackBar(
              context: context,
              state: ToastStates.error,
              description: state.loginMessage,
            );

          default:
        }

        switch (state.socialLoginStates) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            Navigator.of(context).pop();
            _checkChildIsBlockedOrNot(state.loginMessage);
          case RequestStates.error:
            Navigator.of(context).pop();
            showSnackBar(
              context: context,
              state: ToastStates.error,
              description: state.loginMessage,
            );
          default:
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
              _emailFocusNode.unfocus();
              _passwordFocusNode.unfocus();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.loginToYourAccount,
                      style: context.typography.displayMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -1.60,
                      ),
                    ),
                    Text(
                      AppStrings.itsGreatToSeeYouAgain,
                      style: context.typography.titleMedium.copyWith(
                        color: context.colors.primary5,
                        fontWeight: MobileAppFontWeightsConfig().regular,
                      ),
                    ),
                    Spacing.spaceHS24,
                    EmailInputFiled(
                      emailController: _emailController,
                      emailFocusNode: _emailFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    Spacing.spaceHS16,
                    PasswordInputFiled(
                      label: AppStrings.password,
                      passwordController: _passwordController,
                      passwordFocusNode: _passwordFocusNode,
                    ),
                    Spacing.spaceHS16,
                    Row(
                      children: [
                        Text(
                          AppStrings.forgetYourPassword,
                          style: context.typography.bodyMedium,
                        ),
                        TextButtonWidget(
                          style: context.typography.bodyLarge.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          text: AppStrings.resetYourPassword,
                          onPressed: () {
                            _goToForgetPasswordScreen();
                          },
                        ),
                      ],
                    ),
                    Spacing.spaceHS24,

                    DefaultButtonWidget(
                      label: AppStrings.login,
                      onPressed: _login,
                      buttonColor: context.colors.primary9,
                    ),

                    Spacing.spaceHS24,

                    const DividerOrWidget(),

                    Spacing.spaceHS16,

                    const GetSocialView(),

                    Spacing.spaceHS16,

                    BlocBuilder<GlobalBloc, GlobalState>(
                      builder: (context, state) {
                        switch (state.getGuestDataState) {
                          case RequestStates.loading:
                            return LoadingShimmerStructure(
                              height: AppReference.deviceHeight(context) * 0.05,
                            );
                          case RequestStates.loaded:
                            return DefaultButtonWidget(
                              onPressed: _guestOnTap,
                              label: AppStrings.loginAsGuest,
                            );

                          case RequestStates.error:
                            return DefaultButtonWidget(
                              onPressed: _guestOnTap,
                              label: AppStrings.loginAsGuest,
                            );

                          default:
                            return DefaultButtonWidget(
                              onPressed: _guestOnTap,
                              label: AppStrings.loginAsGuest,
                            );
                        }
                      },
                    ),
                    Spacing.spaceHS16,
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.dontHaveAnAccount,
                              style: context.typography.bodyMedium,
                            ),
                            TextSpan(
                              text: AppStrings.join,
                              style: context.typography.bodyLarge.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _goToSignUpScreen();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    Spacing.spaceHS16,

                    const ContactUsWidgetInLoginScreen(),
                  ],
                ),
              ),
            ),
          ),
        ).paddingBody(),
      ),
    );
  }

  _goToForgetPasswordScreen() {
    RouteManager.rPushNamed(
      context: context,
      rName: AppRoutesNames.rForgotPasswordScreen,
    );
  }

  _guestOnTap() async {
    if (!await getIt<NetworkInfo>().isConnected) {
      if (context.mounted) {
        showSnackBar(
          description: AppStrings.noInternetConnection,
          state: ToastStates.warning,
          context: context,
        );
      }
    } else {
      if (mounted) {
        getIt<BaseAppSecurityData>().deleteToken().then((value) {
          BlocProvider.of<GlobalBloc>(context).add(GetGuestDataEvent());
          BlocProvider.of<GlobalBloc>(context).stream.listen((event) {
            if (event.getGuestDataState == RequestStates.loaded) {
              RouteManager.rPushNamed(
                context: context,
                rName: AppRoutesNames.rHomeLayoutView,
              );
            }
          });
        });
      }
    }
  }

  void _checkChildIsBlockedOrNot(String loginMessage) {
    if (context.read<LoginBloc>().userData.isLocked == true) {
      showStatusDialog(
        context: context,
        state: ToastStates.error,
        message: AppStrings.contactWithOwner,
      );
      return;
    } else {
      showSnackBar(
        description: loginMessage,
        state: ToastStates.congrats,
        context: context,
      );
      _goToHome();
    }
  }

  void _goToHome() {
    RouteManager.rPushNamedAndRemoveUntil(
      context: context,
      rName: AppRoutesNames.rHomeLayoutView,
    );
  }

  _login() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
        LoggedIn(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    } else {
      showSnackBar(
        description: "Please fill in all required fields correctly.",
        state: ToastStates.warning,
        context: context,
      );
    }
  }

  void _goToSignUpScreen() {
    RouteManager.rPushNamed(
      context: context,
      rName: AppRoutesNames.rSignUpScreen,
    );
  }
}
