import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/common/widgets/custom_button.dart';
import 'package:todo_api_application_getx/common/widgets/text_button.dart';
import 'package:todo_api_application_getx/common/widgets/text_failed.dart';
import 'package:todo_api_application_getx/features/auth/controller/login/login_controller.dart';
import 'package:todo_api_application_getx/features/auth/view/register/widgets/register_header.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(
                text: 'Sign in to your \naccount',
                supText: 'Enter your account',
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.form,
                  child: Column(
                    children: [
                      CustomTextFormFailed(
                          validator: (email) => controller.validateEmail(email),
                          label: 'Email',
                          controller: controller.email),
                      CustomTextFormFailed(
                          validator: (pwd) => controller.validatePassword(pwd),
                          label: 'Password',
                          isSuffix: true,
                          controller: controller.password),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(text: 'Forget Password ?'),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                          text: 'Sign in',
                          onPressed: () {
                            controller.login();
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
