import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/personal/model/profile.dart';

class GetProfileController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = true.obs;
   var result = Result(
    email: '',
    username: '',
  );

  Future<Result> getProfile() async {
    final SharedPreferences prefs = await _prefs;

    final uri = Uri.parse('http://192.168.1.5:9000/api/profile');
    try {
      isLoading(true);
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.get('token')}'
        },
      );
      if (response.statusCode == 200) {
        isLoading(false);
        final data = jsonDecode(response.body);
        result = Result.fromJson(data['result']);
      } else {
        print(response.body);
        throw Exception(' ERROR ');
      }
    } finally {}
    return result;
  }
}
