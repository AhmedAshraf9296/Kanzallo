import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
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
              padding: const EdgeInsets.only(left: 20,right: 20),
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
                  SizedBox(height: 20,),
                  SearchFormText(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
