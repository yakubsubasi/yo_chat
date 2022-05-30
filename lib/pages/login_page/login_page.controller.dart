import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';

class LoginPageController extends GetxController {
  final phoneNumber = ''.obs;
  final phoneNumberError = RxnString();
  final countryCode = ''.obs;

  void login() {
    final authController = Get.find<AuthenticationController>();
    authController.login(countryCode.value + phoneNumber.value);
  }
}
