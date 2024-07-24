import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/features/auth/controller/onboarding/onboarding_controller.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = OnboardingController.instance;

    return Positioned(
      bottom: 50,
      left: 75,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0.5, 1), blurRadius: 70),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        width: size.width * 0.6,
        child: ElevatedButton(
            onPressed: controller.nextPage,
            child: Text(
              text,
              style: appStyle(
                  20, const Color.fromRGBO(56, 87, 188, 1), FontWeight.bold),
            )),
      ),
    );
  }
}
