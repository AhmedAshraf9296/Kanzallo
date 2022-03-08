import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';
import 'package:kanzalloshop/routes/routes.dart';
import 'package:kanzalloshop/utils/my_string.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              "SIGN",
                              28,
                              FontWeight.bold,
                              Get.isDarkMode ? secondalymainColor : greenColor,
                              TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              "UP",
                              28,
                              FontWeight.w500,
                              Get.isDarkMode ? Colors.black : Colors.white,
                              TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(nameController, false, (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "Enter Valid Username";
                          } else {
                            return null;
                          }
                        },
                            Get.isDarkMode
                                ? Image.asset(
                                    "assets/images/user.png",
                                    color: Colors.purple.withOpacity(.70),
                                  )
                                : const Icon(
                                    Icons.person,
                                    color: greenColor,
                                    size: 30,
                                  ),
                            const Text(""),
                            "User Name"),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(emailController, false, (value) {
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
                            "Email"),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(passwordController,
                              controller.isVisibilty?false:true,
                              (value) {
                            if (value.toString().length < 6) {
                              return "Password should be longer than or equal to 6 characters";
                            } else {
                              return null;
                            }
                          },
                              Get.isDarkMode
                                  ? Image.asset(
                                      "assets/images/lock.png",
                                      color: Colors.purple.withOpacity(.70),
                                    )
                                  : const Icon(
                                      Icons.lock,
                                      size: 30,
                                      color: greenColor,
                                    ),
                              IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              "Password");
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                         CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthButton("SIGN UP", () {}),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder("Already have an account ?  ", "Log In", () {
                Get.offNamed(Routes.loginScreen);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
