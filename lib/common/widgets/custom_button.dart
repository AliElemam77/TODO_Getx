import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = const Color.fromRGBO(30, 47, 103, 1),
  });
  final void Function()? onPressed;
  final String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.84,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        onPressed: onPressed,
        child: ReusableText(
          text: text,
          style: appStyle(25, Colors.white, FontWeight.w600),
        ),
      ),
    );
  }
}
