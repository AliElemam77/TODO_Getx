import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/features/todo/model/add_task/add_task.dart';
import 'package:todo_api_application_getx/features/todo/model/get_task/get_task.dart';
import 'package:todo_api_application_getx/features/todo/view/home/home.dart';

class TodoController extends GetxController {
  late bool isLoading;
  late String id;
  List<CResult> result = [];
  late TextEditingController task = TextEditingController();
  late TextEditingController taskContent = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  @override
  void onClose() {
    super.onClose();
    task.dispose();
    taskContent.dispose();
  }

  getNotes() async {
    final SharedPreferences prefs = await _prefs;
    print(prefs.get('token'));

    final url = Uri.parse('http://192.168.1.5:9000/api/notes');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.get('token')}'
      },
    );
    var data = await jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('طرش');
      result = Task.fromJson(data).result!;

      update();
    } else {
      Get.snackbar('Error', 'Failed To Fetch');
    }
    update();
  }

  addTasks() async {
    isLoading = true;
    final SharedPreferences prefs = await _prefs;
    CAddTasks addTasks = CAddTasks(
      taskName: task.text.toString(),
      taskContent: taskContent.text.toString(),
    );

    final url = Uri.parse('http://192.168.1.5:9000/api/notes');
    final body = {
      'title': addTasks.taskName,
      'content': addTasks.taskContent,
    };
    final response = await http.post(
      url,
      body: body,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.get('token')}'
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      Get.snackbar(
        'Add Successfully',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.to(() => const Home());
      task.text = '';
      taskContent.text = '';
      getNotes();
    } else {
      print(response.body);
      final data = jsonDecode(response.body);
      Get.snackbar(
        'Add Feild',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  editTasks(id) async {
    final SharedPreferences prefs = await _prefs;
    CAddTasks addTasks = CAddTasks(
      taskName: task.text.toString(),
      taskContent: taskContent.text.toString(),
    );

    final url = Uri.parse('http://192.168.1.5:9000/api/notes/$id');
    final body = {
      'title': addTasks.taskName,
      'content': addTasks.taskContent,
      '_method': 'put',
    };
    final response = await http.post(
      url,
      body: body,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.get('token')}'
      },
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.snackbar(
        'Edit Successfully',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );

      task.text = '';
      taskContent.text = '';
      getNotes();
      Get.to(() => const Home());
    } else {
      print(response.body);
      final data = jsonDecode(response.body);
      Get.snackbar(
        'Edition is Feild',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  deleteTasks(id) async {
    final SharedPreferences prefs = await _prefs;
    final url = Uri.parse('http://192.168.1.5:9000/api/notes/$id');

    final response = await http.delete(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${prefs.get('token')}'
      },
    );
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Get.snackbar(
        'Delete Successfully',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );

      getNotes();
    } else {
      print(response.body);
      final data = jsonDecode(response.body);
      Get.snackbar(
        'Delete Feild',
        '${data['message']}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }
}
