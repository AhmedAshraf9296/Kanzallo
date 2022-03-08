
import 'package:get/get.dart';
import 'package:kanzalloshop/logic/Controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }
}