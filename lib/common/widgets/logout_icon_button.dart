import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/auth/controller/login/login_controller.dart';
import 'package:todo_api_application_getx/features/auth/view/register/register.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();

    return IconButton(
        onPressed: () async {
          final SharedPreferences prefs = await prefs0;
          await prefs.remove('token');
          

          Get.offAll(const Register());
        },
        icon: const Icon(Icons.logout_outlined,size: 30,color: Colors.white,));
  }
}
