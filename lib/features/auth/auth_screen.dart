import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';

import '../../config/resources/app_strings.dart';
import '../../core/responsive_manager/spacing_facade.dart';
import '../../core/shared_widget/custom_tabs.dart';
import 'login/presentation/login_screen/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedTabIndex = 1; // 0 = SignUp, 1 = Login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.screenPaddingP24),
          child: !AppReference.isPortrait(context)
              ? const TabletAuthView()
              : const MobileAuthView(),
        ),
      ),
    );
  }
}

class TabletAuthView extends StatelessWidget {
  const TabletAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: AppReference.deviceWidth(context) * 0.2),
        Expanded(child: MobileAuthView()),
        SizedBox(width: AppReference.deviceWidth(context) * 0.2),
      ],
    );
  }
}

class MobileAuthView extends StatefulWidget {
  const MobileAuthView({super.key});

  @override
  State<MobileAuthView> createState() => _MobileAuthViewState();
}

class _MobileAuthViewState extends State<MobileAuthView> {
  int selectedTabIndex = 1; // 0 = SignUp, 1 = Login

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.spaceHS24,
        CustomTabs(
          firstTabText: AppStrings.login,
          secondTabText: AppStrings.newUser,
          onTabChanged: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
        ),
        Spacing.spaceHS24,
        Expanded(
          child: IndexedStack(
            index: selectedTabIndex,
            children: [LoginScreen(), SignUpScreen()],
          ),
        ),
      ],
    );
  }
}
