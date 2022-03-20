import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/languages/localization.dart';
import 'package:kanzalloshop/logic/Controller/theme_controller.dart';
import 'package:kanzalloshop/routes/routes.dart';
import 'package:kanzalloshop/utils/my_string.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  // print('background message ${message.notification!.body}');
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      'resource://drawable/notification_icon',
      [            // notification icon
        NotificationChannel(
          channelGroupKey: 'basic_test',
          channelKey: 'basic',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),
        NotificationChannel(
            channelGroupKey: 'image_test',
            channelKey: 'image',
            channelName: 'image notifications',
            channelDescription: 'Notification channel for image tests',
            defaultColor: Colors.redAccent,
            ledColor: Colors.white,
            channelShowBadge: true,
            importance: NotificationImportance.High
        )
        //add more notification type with different configuration
      ]
  );
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
          title: 'Kanzallo Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemesApp.light,
          darkTheme: ThemesApp.dark,
          themeMode: ThemeController().themeDataGet,
          locale: Locale(GetStorage().read<String>('lang').toString()),
          fallbackLocale: Locale(ene),
          translations: LocalizationApp(),
          initialRoute: FirebaseAuth.instance.currentUser != null ||
                  GetStorage().read<bool>('auth') == true
              ? Routes.mainScreen
              : Routes.welcomeScreen,
          getPages: AppRoutes.routes),
    );
  }
}
