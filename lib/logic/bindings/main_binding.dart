import 'package:get/get.dart';
import 'package:kanzalloshop/logic/Controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(MainController());
  }
}