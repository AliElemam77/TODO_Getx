import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    this.onTap,
    required this.text,
  });
  void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ReusableText(
        text: text,
        style: appStyle(15, Colors.blue.shade900, FontWeight.w400),
      ),
    );
  }
}
