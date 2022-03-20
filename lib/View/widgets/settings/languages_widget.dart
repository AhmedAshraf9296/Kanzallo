import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/settings_controller.dart';
import 'package:kanzalloshop/utils/my_string.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: darkSettings),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtils(
                  "Language".tr,
                  22,
                  FontWeight.bold,
                  Get.isDarkMode ? Colors.black : Colors.white,
                  TextDecoration.none,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode ? Colors.black : Colors.white,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                iconSize: 25,
                icon: Icon(Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      english,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      arabic,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      france,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: frf,
                  ),
                ],
                value: controller.langLocal,
                onChanged: (value) {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
