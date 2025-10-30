import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/features/intro/onboarding/dummy_data.dart';
import 'package:ecommerce_app/features/intro/onboarding/on_boarding_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/shared_widget/buttons/button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  final List<DummyData> onBoardingData = [
    const DummyData(
      title: AppStrings.onBoardingTitle1,
      imagePath: Assets.imagesOnboarding1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            final data = onBoardingData[index];
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  // Illustration section
                  Expanded(
                    flex: 9,
                    child: Stack(
                      children: [
                        //background center
                        Align(
                          alignment: Alignment.center,

                          child: SvgPicture.asset(
                            Assets.imagesBackground2,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                        ),
                        //text top
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              data.title,
                              style: context.typography.displayLarge.copyWith(
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        //image bottom
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            Assets.imagesOnboarding2,
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content section
                  Expanded(
                    child: DefaultButtonWidget(
                      label: _currentPage < onBoardingData.length - 1
                          ? AppStrings.continueON
                          : AppStrings.getStarted,
                      onPressed: () {
                        if (_currentPage < onBoardingData.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _goToLoginPage();
                        }
                      },
                    ).paddingBody(),
                  ),
                ],
              ),
            );
          },
        ),
      ).paddingBody(),
    );
  }

  void _goToLoginPage() {
    getIt<OnBoardingLocalData>().saveOnBoardingValue(isShowed: true).then((
      value,
    ) {
      if (mounted) {
        RouteManager.rPushNamedAndRemoveUntil(
          context: context,
          rName: AppRoutesNames.rLoginScreen,
        );
      }
    });
  }
}
