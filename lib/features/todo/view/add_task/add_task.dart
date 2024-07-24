import 'dart:math';

import 'package:get/get.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/custom_button.dart';
import 'package:todo_api_application_getx/common/widgets/header_text.dart';
import 'package:todo_api_application_getx/common/widgets/header_text_back_button.dart';
import 'package:todo_api_application_getx/features/todo/controller/tasks/add_tasks.dart';
import 'package:todo_api_application_getx/features/todo/view/add_task/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key, this.edit = false, this.id});
  final bool edit;
  final int? id;
  @override
  Widget build(BuildContext context) {
    Get.put(TodoController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 70,
              child: HeaderTextWithBack(
                  text: edit == false ? 'Add Some Tasks' : 'Edit This Task'),
            ),
            Positioned(
              top: 200,
              right: 35,
              child: GetBuilder<TodoController>(
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(
                        text: edit == false ? 'Title' : "Edit Title",
                        style: appStyle(25, Colors.black, FontWeight.bold)),
                    const SizedBox(height: 12),
                    CustomBoldTextFormFailed(
                      controller: controller.task,
                    ),
                    const SizedBox(height: 40),
                    HeaderText(
                        text: edit == false ? 'Task Details' : "Edit Details",
                        style: appStyle(25, Colors.black, FontWeight.bold)),
                    const SizedBox(height: 12),
                    CustomBoldTextFormFailed(
                        controller: controller.taskContent, minLines: 7),
                    const SizedBox(height: 40),
                    CustomButton(
                      onPressed: () {
                        if (edit == false) {
                          controller.addTasks();
                        } else {
                          controller.editTasks(id);
                        }
                      },
                      text: edit == false ? "Add" : "Edit",
                      color: const Color.fromARGB(255, 63, 90, 104),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
