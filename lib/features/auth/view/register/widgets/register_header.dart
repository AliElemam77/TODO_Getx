import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/circuler_container.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.text, required this.supText});
  final String text;
  final String supText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(56, 87, 188, 1),
            Color.fromRGBO(9, 24, 72, 1),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -15,
            left: -100,
            child: CustomCirculerContainer(
              width: size.width * 0.8,
              height: size.height * 0.4,
              backgroundColor: const Color.fromARGB(43, 255, 255, 255),
            ),
          ),
          Positioned(
            top: -90,
            left: -30,
            child: CustomCirculerContainer(
              width: size.width * 0.8,
              height: size.height * 0.4,
              backgroundColor: const Color.fromARGB(34, 255, 255, 255),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  text: text,
                  style: appStyle(40, Colors.white, FontWeight.bold),
                ),
                ReusableText(
                  text: supText,
                  style: appStyle(20, Colors.white, FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
