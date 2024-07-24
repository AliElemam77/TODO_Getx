import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_api_application_getx/features/auth/controller/onboarding/onboarding_controller.dart';
import 'package:todo_api_application_getx/features/auth/view/onboarding/widgets/dot_indicator.dart';
import 'package:todo_api_application_getx/features/auth/view/onboarding/widgets/next_button.dart';
import 'package:todo_api_application_getx/features/auth/view/onboarding/widgets/onboarding_page.dart';
import 'package:todo_api_application_getx/features/auth/view/onboarding/widgets/skip_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(56, 87, 188, 1),
          Color.fromRGBO(9, 24, 72, 1),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Stack(
                children: [
                  PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.updateDotIndicator,
                    children: const [
                      OnboardingPage(
                          text: 'WElCOME TO WRITE ME',
                          supText:
                              'This application is designed with you in mind, \n providing a seamless and intuitive experience to \n help you manage your tasks efficiently.',
                          image: 'assets/images/onboarding.png'),
                      OnboardingPage(
                          text: 'TASK MANAGEMENT',
                          supText:
                              'Whether you are looking to organize your daily\n activities, keep track of important deadlines,\n or collaborate with others, our app is here to\n assist you every step of the way.',
                          image: 'assets/images/onboarding.png'),
                      OnboardingPage(
                          text: 'CREATE AN ACCOUNT',
                          supText:
                              'Sign up to get started. You can use your email or\n social media accounts for quick registration.',
                          image: 'assets/images/onboarding.png'),
                    ],
                  ),
                  if (controller.currentIndex.value < 2) const SkipButton(),
                  NextButton(
                      text: controller.currentIndex.value == 2
                          ? 'Register'
                          : 'Continue'),
                  DotIndicator(),
                ],
              ),
            )),
      ),
    );
  }
}
