import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/features/auth/controller/login/login_controller.dart';

class CustomTextFormFailed extends StatelessWidget {
  CustomTextFormFailed({
    super.key,
    this.isSuffix = false,
    required this.label,
    this.controller,
    this.validator,
  });
  final bool isSuffix;
  TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: size.width * 0.89,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon:
                isSuffix ? const Icon(Icons.remove_red_eye_outlined) : null,
            label: Text(label),
            labelStyle: appStyle(15, Colors.black, FontWeight.w600),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
