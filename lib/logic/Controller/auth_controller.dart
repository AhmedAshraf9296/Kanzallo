import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }
  void checkBox(){
    isCheckBox = !isCheckBox;
    update();
  }
}
