import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/auth/view/register/register.dart';

class OnboardingController extends GetxController {
  RxBool isFirstTime = true.obs;
  RxInt currentIndex = 0.obs;
  final pageController = PageController();

  void completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    isFirstTime.value = false;
  }

  static OnboardingController get instance => Get.find();

  void updateDotIndicator(index) {
    currentIndex.value = index;
  }

  void skipClick() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void nextPage() async {
    if (currentIndex.value == 2) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstTime', false);
      isFirstTime.value = false;
      Get.offAll(() => const Register(), transition: Transition.fade);
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(
        page,
      );
    }
  }
}
