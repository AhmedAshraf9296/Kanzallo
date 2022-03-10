import 'package:get/get.dart';
import 'package:kanzalloshop/View/screens/auth/forgot_password_screen.dart';
import 'package:kanzalloshop/View/screens/auth/login_screen.dart';
import 'package:kanzalloshop/View/screens/auth/signup_screen.dart';
import 'package:kanzalloshop/View/screens/main_screen.dart';
import 'package:kanzalloshop/View/screens/welcome_screen.dart';
import 'package:kanzalloshop/logic/bindings/auth_binding.dart';
import 'package:kanzalloshop/logic/bindings/main_binding.dart';

class AppRoutes {
  // initialRoute

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeSreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPassword';
  static const mainScreen = '/mainScreen';
}
