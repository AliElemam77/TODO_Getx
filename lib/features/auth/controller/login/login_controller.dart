import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/auth/model/login/login_model.dart';
import 'package:todo_api_application_getx/features/todo/view/home/home.dart';

class LoginController extends GetxController {
  final form = GlobalKey<FormState>();
  var isLoggedIn = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future checkLoginStatus() async {
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');

    if (token != null) {
      isLoggedIn.value = true;
      Get.offAll(
          () => const Home()); // Directly go to home if token is available
    }
  }

  Future login() async {
    UserLogin user = UserLogin(
      email: email.text.toString().trim(),
      password: password.text.toString().trim(),
    );
    try {
      final uri = Uri.parse('http://192.168.1.5:9000/api/login');
      final body = {'email': user.email, 'password': user.password};
      final headers = {
        // 'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await http.post(uri, body: body, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var token = data['result']['token'];
        print('token: $token');
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        isLoggedIn.value = true;
        if (form.currentState!.validate()) {
          Get.snackbar(
            'Success',
            'Login Successful',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
          );

          Get.offAll(const Home());
        }
      } else {
        Get.snackbar('Error', 'Login Failed',
            dismissDirection: DismissDirection.down,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(10));
        return print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return;
    }
  }

  validatePassword(String? pwd) {
    if (GetUtils.isLengthGreaterOrEqual(pwd, 20) ||
        GetUtils.isLengthLessOrEqual(pwd, 6)) {
      return;
    }
  }
}
