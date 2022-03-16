import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';

class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller){
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
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
          splashColor: Get.isDarkMode?mainColor.withOpacity(0.4):Colors.white,
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: logOutSettings),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                "Logout",
                22,
                FontWeight.bold,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.none,
              ),
            ],
          ),
        ),
      );
    });
  }
}
