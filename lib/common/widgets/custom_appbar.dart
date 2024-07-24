import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api_application_getx/common/style/style_app.dart';
import 'package:todo_api_application_getx/common/widgets/logout_icon_button.dart';

import 'package:todo_api_application_getx/common/widgets/reusable_text.dart';
import 'package:todo_api_application_getx/features/personal/controller/profile/get_profile_data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(GetProfileController(),permanent: true);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 10),
              color: Colors.grey, blurRadius: 15,spreadRadius: 6),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: FutureBuilder(
                future: controller.getProfile(),
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? ReusableText(
                          text: "Hi, ${snapshot.data!.username} 👋🏼",
                          style: appStyle(28, Colors.white, FontWeight.w600),
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
            const LogoutIconButton()
          ],
        ),
      ),
    );
  }
}
