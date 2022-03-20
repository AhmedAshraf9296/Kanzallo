import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushNotifications extends GetxController {
  late FirebaseMessaging messaging;

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      // ignore: avoid_print
      print(value.toString());
    });
    getMessages().asStream();
  }

  Future<void> getMessages() async {
     FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      getNotifications(
        event.notification!.title.toString(),
        event.notification!.body.toString(),
        event.notification!.android!.imageUrl.toString(),
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // ignore: avoid_print
      print('Message clicked!');
    });
  }

  void getNotifications(String title, String body, String image) async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      //show notification
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: 'basic',
          //set configuration wuth key "basic"
          title: title,
          body: body,
          largeIcon: image,
        ),
      );
    }
  }
}
