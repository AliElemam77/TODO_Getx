import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/common/widgets/custom_button.dart';
import 'package:todo_api_application_getx/common/widgets/text_button.dart';
import 'package:todo_api_application_getx/common/widgets/text_failed.dart';
import 'package:todo_api_application_getx/features/auth/controller/register/register_controller.dart';
import 'package:todo_api_application_getx/features/auth/view/login/login.dart';
import 'package:todo_api_application_getx/features/auth/view/register/widgets/register_header.dart';

import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.form,
            child: Column(
              children: [
                const LoginHeader(
                  text: 'Register',
                  supText: 'create your account',
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomTextFormFailed(
                          controller: controller.name,
                          validator: (name) => controller.validateName(name),
                          label: "Name"),
                      CustomTextFormFailed(
                          controller: controller.phone,
                          validator: (phone) => controller.validatePhone(phone),
                          label: "Phone"),
                      CustomTextFormFailed(
                          controller: controller.email,
                          validator: (email) => controller.validateEmail(email),
                          label: "Email"),
                      CustomTextFormFailed(
                          controller: controller.password,
                          validator: (password) =>
                              controller.validatePassword(password),
                          label: 'Password'),
                      CustomTextFormFailed(
                          controller: controller.passwordConfirmation,
                          validator: (passwordConfirmation) =>
                              controller.validatePassword(passwordConfirmation),
                          label: "Confirm Password"),
                      const SizedBox(height: 12),
                      CustomButton(
                          onPressed: () => controller.register(),
                          text: 'Register'),
                    ],
                  ),
                ),
                CustomTextButton(
                    text: 'I already have account',
                    onTap: () {
                      Get.to(() => const Login());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
