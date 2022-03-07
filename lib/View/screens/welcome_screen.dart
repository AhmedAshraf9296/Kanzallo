import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/text_utils.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.4)),
                    child: const Center(
                        child: TextUtils('Welcome', 35, FontWeight.bold,
                            Colors.white, TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils("Kanzallo", 35, FontWeight.bold, secondalymainColor,
                            TextDecoration.none),
                        SizedBox(
                          width: 10,
                        ),
                        TextUtils("Shop", 35, FontWeight.bold, Colors.white,
                            TextDecoration.none)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {Get.toNamed(Routes.loginScreen);},
                    child: const TextUtils("Get Start", 22, FontWeight.bold,
                        Colors.white, TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils("Don't have an Account ?", 18,
                          FontWeight.normal, Colors.white, TextDecoration.none),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils("Sign Up", 18, FontWeight.normal,
                            Colors.white, TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
