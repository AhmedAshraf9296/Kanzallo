import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() function;
   const AuthButton(this.text, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ?mainColor:greenColor,
        minimumSize: const Size(360,50),
      ),
      onPressed: function,
      child: TextUtils(text, 18, FontWeight.bold,  Colors.white, TextDecoration.none),
    );
  }
}
