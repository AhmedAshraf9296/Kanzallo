import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/category/category_widget.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white:Colors.grey.shade700,
        body: Padding(
          padding: const EdgeInsets.only(left: 15,  right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 12),
                  child: TextUtils(
                    "Category",
                    30,
                    FontWeight.bold,
                    Get.isDarkMode ? Colors.black : Colors.white,
                    TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryWidget(),
            ],
          ),
        ));
  }
}
