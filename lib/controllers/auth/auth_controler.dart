import 'package:get/get.dart';

class AuthControler extends GetxController {
  void goLogin() {
    Get.toNamed('/login');
  }

  void goSignup() {
    Get.toNamed('/signup');
  }

  void goMain() {
    Get.offAndToNamed('/main');
  }
}
