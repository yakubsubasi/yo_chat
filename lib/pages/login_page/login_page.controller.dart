import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';

class LoginPageController extends GetxController {
  final phoneNumber = ''.obs;

  void login() {
    final authController = Get.find<AuthenticationController>();
    authController.login(phoneNumber.value);
  }
}
