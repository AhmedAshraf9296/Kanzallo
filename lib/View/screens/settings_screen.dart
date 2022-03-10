import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';
import 'package:kanzalloshop/logic/bindings/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ThemeController().changeThem();
            },
            child: Text(
              "Dark Mode",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Logout From App",
                  titleStyle: const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold),
                  middleText: "Are you sure to logout",
                  middleTextStyle: const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold),
                  backgroundColor: Colors.grey.shade300,
                  radius: 10,
                  textCancel: "No ",
                  cancelTextColor: Colors.black,
                  textConfirm: "Yes",
                  confirmTextColor: Colors.black,
                  onCancel: (){Get.back();},
                  onConfirm: (){ controller.signOutFromApp();},
                  buttonColor: Get.isDarkMode ? greenColor:Colors.pinkAccent.shade200
                );
              },
              child: Text(
                "Log Out",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            );
          }),
        ],
      )),
    );
  }
}
