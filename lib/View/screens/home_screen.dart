import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/home/card_items.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode?Colors.white:Colors.black,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? greenColor : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  20,
                ),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextUtils("Find Your", 25, FontWeight.bold, Colors.white,
                      TextDecoration.none),
                  SizedBox(
                    height: 5,
                  ),
                  TextUtils("INSPIRATION", 28, FontWeight.bold, Colors.white,
                      TextDecoration.none),
                  SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                "Categories",
                20,
                FontWeight.w500,
                Get.isDarkMode? Colors.black:Colors.white,
                TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 30,),
           CardItems(),
        ],
      ),
    ));
  }
}
