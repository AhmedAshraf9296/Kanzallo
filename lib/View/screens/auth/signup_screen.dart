import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          TextUtils(
                            "SIGN",
                            28,
                            FontWeight.bold,
                            secondalymainColor,
                            TextDecoration.none,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            "UP",
                            28,
                            FontWeight.w500,
                            Colors.black,
                            TextDecoration.none,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                          nameController,
                          false,
                          () {},
                          Image.asset(
                            "assets/images/user.png",
                            color: Colors.purple.withOpacity(.70),
                          ),
                          const Text(""),
                          "User Name"),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                          emailController,
                          false,
                          () {},
                          Image.asset(
                            "assets/images/email.png",
                            color: Colors.purple.withOpacity(.70),
                          ),
                          const Text(""),
                          "Email"),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                          passwordController,
                          true,
                          () {},
                          Image.asset(
                            "assets/images/lock.png",
                            color: Colors.purple.withOpacity(.70),
                          ),
                          const Text(""),
                          "Password"),
                      const SizedBox(
                        height: 50,
                      ),
                      const CheckWidget(),
                      const SizedBox(height: 50,),
                      AuthButton("SIGN UP", () {

                      }),
                    ],
                  ),
                ),
              ),
              ContainerUnder("Already have an account ?  ","Log In",(){

              }),
            ],
          ),
        ),
      ),
    );
  }
}
