import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';

class HeaderText extends StatelessWidget {
  HeaderText({
    super.key,
    required this.text,
    required this.style,
  });
  String text;
  TextStyle style;
  @override
  Widget build(BuildContext context) {
    return ReusableText(text: text, style: style);
  }
}
