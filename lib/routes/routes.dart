import 'package:get/get.dart';
import 'package:kanzalloshop/View/screens/auth/login_screen.dart';
import 'package:kanzalloshop/View/screens/auth/signup_screen.dart';
import 'package:kanzalloshop/View/screens/welcome_screen.dart';

class AppRoutes {
  // initialRoute

  static const welcome = Routes.welcomeScreen;
  static const login = Routes.loginScreen;
  static const signup = Routes.signUpScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: Routes.signUpScreen, page: () =>   SignUpScreen()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeSreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
