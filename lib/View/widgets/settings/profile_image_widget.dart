import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';
import 'package:kanzalloshop/logic/Controller/settings_controller.dart';

class ProfileImageWidget extends StatelessWidget {
   ProfileImageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=>Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:  BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    authController.displayUserImage.value,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  controller.capitalize(authController.displayUserName.value),
                  22,
                  FontWeight.bold,
                  Get.isDarkMode?Colors.black:Colors.white,
                  TextDecoration.none,
                ),
                TextUtils(
                  authController.displayUserEmail.value,
                  14,
                  FontWeight.bold,
                  Get.isDarkMode?Colors.black:Colors.white,
                  TextDecoration.none,
                ),
              ],
            ),
          ],
        ))
      ],
    );
  }
}
