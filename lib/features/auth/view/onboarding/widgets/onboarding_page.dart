import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.text,
    required this.image,
    required this.supText,
  });
  final String text;
  final String supText;
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          ReusableText(
            text: text,
            style: appStyle(
              30,
              Colors.white,
              FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height*0.05,),
          ReusableText(
            maxLines: 5,
            text: supText,
            style: appStyle(
              14,
              Colors.white,
              FontWeight.w600,
            ),
          ),
          Image(
            width: double.infinity,
            height: size.height * 0.5,
            image: AssetImage(image),
          ),
        ],
      ),
    );
  }
}
