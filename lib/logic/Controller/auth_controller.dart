import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kanzalloshop/Model/facebook_model.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserImage = ''.obs;
  var displayUserEmail = ''.obs;

  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  final GetStorage authBox = GetStorage();
  var isSignedIn = false;

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    displayUserEmail.value =
    (userProfile != null ? userProfile!.email : "")!;
    displayUserImage.value =
    (userProfile != null ? userProfile!.photoURL : "")!;
  }

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
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = userName;
        auth.currentUser!.updateDisplayName(displayUserName.value);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
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

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = auth.currentUser!.displayName!;
      });
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account Does't exist for that $email ... Create your account by signing up...";
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password ... PLease try again!  ';
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

  void resetPasswordFirebase(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account Does't exist for that $email ... Create your account by signing up...";
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

  void googleSignUpUsingFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserImage.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
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

  void facebookSignUpUsingFirebase() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserImage.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
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
}
