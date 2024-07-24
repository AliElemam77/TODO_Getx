import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/auth/model/register/register.dart';
import 'package:todo_api_application_getx/features/todo/view/home/home.dart';

class RegisterController extends GetxController {
  final form = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoggedIn = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  Future register() async {
    Register register = Register(
        email: email.text.toString(),
        name: name.text.toString(),
        phone: phone.text.toString(),
        password: password.text.toString(),
        passwordConfirmation: passwordConfirmation.text.toString());
    final url = Uri.parse('http://192.168.1.5:9000/api/register');
    final body = {
      'email': register.email,
      'name': register.name,
      'phone': register.phone,
      'password': register.password,
      'password_confirmation': register.passwordConfirmation,
    };
    print(email.text);
    print(password.text);
    try {
      final response = await http.post(url, body: body);
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        var token = data['result']['token'];
        print(data['message']);
        print('token: $token');
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        if (form.currentState!.validate()) {
          Get.snackbar(
            'Success',
            'Register Successful',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
          );
          Get.to(() => const Home());
        }
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar('Error', 'Register Failed',
            dismissDirection: DismissDirection.down,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(10));

        print(data);
      }
    } catch (e) {}
  }

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return;
    }
  }

  validateName(String? name) {
    if (!GetUtils.isLengthLessOrEqual(name, 10) ||
        !GetUtils.isUsername(name!)) {
      return;
    }
  }

  validatePhone(String? phone) {
    if (!GetUtils.isPhoneNumber(phone!)) {
      return;
    }
  }

  validatePassword(String? pwd) {
    if (!GetUtils.isLengthGreaterOrEqual(pwd, 20) ||
        !GetUtils.isLengthLessOrEqual(pwd, 6)) {
      return;
    }
  }
}
