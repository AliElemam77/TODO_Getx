import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/back_buttom.dart';
import 'package:todo_api_application_getx/common/widgets/header_text.dart';

class HeaderTextWithBack extends StatelessWidget {
  HeaderTextWithBack({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButtom(),
        HeaderText(
          text: text,
          style: appStyle(26, Colors.black, FontWeight.bold),
        ),
      ],
    );
  }
}
