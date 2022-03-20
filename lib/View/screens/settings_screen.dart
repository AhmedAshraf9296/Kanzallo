import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/settings/dark_mode_widget.dart';
import 'package:kanzalloshop/View/widgets/settings/languages_widget.dart';
import 'package:kanzalloshop/View/widgets/settings/logout_widget.dart';
import 'package:kanzalloshop/View/widgets/settings/profile_image_widget.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.white : mainColor.withOpacity(0.9),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImageWidget(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            "GENERAL".tr,
            18,
            FontWeight.bold,
            Get.isDarkMode ? mainColor : Colors.white,
            TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
