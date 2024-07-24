import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_api_application_getx/features/auth/controller/onboarding/onboarding_controller.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
      top: 55,
      left: 20,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        effect: const ExpandingDotsEffect(
          dotWidth: 12,
          dotHeight: 10,
          activeDotColor: Colors.white,
        ),
      ),
    );
  }
}
