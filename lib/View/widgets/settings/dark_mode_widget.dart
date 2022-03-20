import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/settings_controller.dart';
import 'package:kanzalloshop/logic/Controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeTrackColor: mainColor,
              activeColor: mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changeThem();
                controller.switchValue.value = value;
              },
            )
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: darkSettings),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            "Dark Mode".tr,
            22,
            FontWeight.bold,
            Get.isDarkMode ? Colors.black : Colors.white,
            TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
