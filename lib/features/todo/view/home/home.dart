import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/custom_appbar.dart';
import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';

import 'package:flutter/material.dart';
import 'package:todo_api_application_getx/features/personal/controller/profile/get_profile_data.dart';
import 'package:todo_api_application_getx/features/todo/controller/tasks/add_tasks.dart';
import 'package:todo_api_application_getx/features/todo/model/get_task/get_task.dart';
import 'package:todo_api_application_getx/features/todo/view/add_task/add_task.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TodoController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Get.to(() => const AddTask());
        },
        label: ReusableText(
          text: 'ADD TASK',
          style: appStyle(20, Colors.white, FontWeight.w500),
        ),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: CustomAppBar(),
        ),
      ),
      body: GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) => (controller.result.isEmpty)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                     
                      image: AssetImage('assets/images/empty.gif'),
                    ),
                    ReusableText(
                        maxLines: 2,
                        text: 'Manage your day',
                        style: appStyle(30, Colors.black, FontWeight.bold)),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: controller.result.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 7)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              controller
                                  .deleteTasks(controller.result[index].id);
                            },
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent, size: 40),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 30,
                            child: Text(
                              "${index + 1}",
                              style:
                                  appStyle(30, Colors.white, FontWeight.bold),
                            ),
                          ),
                          title: ReusableText(
                              textAlign: TextAlign.left,
                              text: controller.result[index].title!,
                              style:
                                  appStyle(32, Colors.black, FontWeight.bold)),
                          subtitle: ReusableText(
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              text: controller.result[index].content!,
                              style:
                                  appStyle(20, Colors.black, FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
