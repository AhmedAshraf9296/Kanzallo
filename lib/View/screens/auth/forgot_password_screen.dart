import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/auth/auth_button.dart';
import 'package:kanzalloshop/View/widgets/auth/auth_text_form_field.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';
import 'package:kanzalloshop/utils/my_string.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        title: Text(
          "Forgot Password",
          style: TextStyle(color: Get.isDarkMode ? greenColor : pinkClr),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                    ),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "If you want to recover your account, then please provice your email ID below ...",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/forgetpass copy.png",
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFormField(
                  emailController,
                  false,
                  (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return "Enter Valid Email";
                    } else {
                      return null;
                    }
                  },
                  Get.isDarkMode
                      ? Image.asset(
                          "assets/images/email.png",
                          color: Colors.purple.withOpacity(.70),
                        )
                      : const Icon(
                          Icons.email,
                          size: 30,
                          color: greenColor,
                        ),
                  const Text(""),
                  "Email",
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton("SEND", () {
                    if (formKey.currentState!.validate()) {
                      String email = emailController.text.trim();
                      controller.resetPasswordFirebase(email);
                    }
                  });
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
