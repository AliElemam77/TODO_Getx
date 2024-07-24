import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/features/auth/controller/onboarding/onboarding_controller.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      right: 15,
      top: 32,
      child: TextButton(
        onPressed: controller.skipClick,
        child: Text(
          'Skip',
          style: appStyle(15, Colors.white, FontWeight.w400),
        ),
      ),
    );
  }
}
