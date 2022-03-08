import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'The Password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: greenColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: greenColor,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase() async {}

  void googleSignUpUsingFirebase() async {}

  void facebookSignUpUsingFirebase() async {}

  void resetPasswordFirebase() async {}

  void signOutFirebase() async {}
}
