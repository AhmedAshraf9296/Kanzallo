import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/bindings/theme_controller.dart';
import 'package:kanzalloshop/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Kanzallo Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().themeDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? Routes.mainScreen
            : Routes.welcomeScreen,
        getPages: AppRoutes.routes);
  }
}
