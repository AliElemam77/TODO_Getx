import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';

class CustomBoldTextFormFailed extends StatelessWidget {
  CustomBoldTextFormFailed({
    super.key,
    this.maxLines,
    this.minLines,
    this.controller,
   
  });
  int? minLines;
  int? maxLines;
  TextEditingController? controller;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.84,
      decoration: BoxDecoration(
        border: Border.all(width: 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: const [BoxShadow(offset: Offset(10, 10))],
      ),
      child: TextField(
        
        controller: controller,
        style: appStyle(20, Colors.black, FontWeight.w500),
        minLines: minLines,
        maxLines: maxLines,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        ),
      ),
    );
  }
}
