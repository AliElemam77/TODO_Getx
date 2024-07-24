import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.text,
      required this.style,
      this.textAlign = TextAlign.center,
      this.maxLines = 1});
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      text,
      style: style,
      softWrap: false,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
