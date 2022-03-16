import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/logic/Controller/settings_controller.dart';

class ProfileImageWidget extends StatelessWidget {
   ProfileImageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://avatars.githubusercontent.com/u/54774016?v=4",
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
                  controller.capitalize("ahmed ashraf"),
                  22,
                  FontWeight.bold,
                  Get.isDarkMode?Colors.black:Colors.white,
                  TextDecoration.none,
                ),
                TextUtils(
                  "AhmedAshraf@gmail.com",
                  14,
                  FontWeight.bold,
                  Get.isDarkMode?Colors.black:Colors.white,
                  TextDecoration.none,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
