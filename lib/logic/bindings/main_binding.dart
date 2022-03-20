import 'package:get/get.dart';
import 'package:kanzalloshop/logic/Controller/main_controller.dart';
import 'package:kanzalloshop/logic/Controller/payment_controller.dart';
import 'package:kanzalloshop/logic/Controller/settings_controller.dart';

import '../Controller/push_notifications_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(
      PaymentController(),
      permanent: true,
    );
    Get.put(PushNotifications());
  }
}
