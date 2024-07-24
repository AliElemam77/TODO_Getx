import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/auth/controller/login/login_controller.dart';
import 'package:todo_api_application_getx/features/auth/view/onboarding/onboarding.dart';
import 'package:todo_api_application_getx/features/todo/view/home/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  // final token;

  @override
  Widget build(BuildContext context) {
    // Widget screen = isLogin ? const Home() : const Login();
    final controller = Get.put(LoginController());
    return 
    GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 235, 232, 232)),
      debugShowCheckedModeBanner: false,
      home: (controller.isLoggedIn.value) ? const Home() : const Onboarding(),
    );
  }
}
