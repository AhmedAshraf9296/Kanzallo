import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset(
                          'assets/images/check.png',
                          color: Colors.purple.withOpacity(.60),
                        )
                      : const Icon(
                          Icons.done,
                          color: greenColor,
                          size: 30,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 15,
          ),
          Row(
            children: [
              TextUtils(
                "I Accept  ",
                16,
                FontWeight.normal,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.none,
              ),
              TextUtils(
                "terms & conditions",
                16,
                FontWeight.normal,
                Get.isDarkMode ? Colors.black : Colors.white,
                TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
