import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';

class LoginPageController extends GetxController {
  final phoneNumber = ''.obs;
  final phoneNumberError = RxnString();

  late final Country selectedCountry;

  void onCountryPickerPressed() async {
    final country = Get.to(PickerPage());
  }

  void login() {
    final authController = Get.find<AuthenticationController>();
    authController.login(phoneNumber.value);
  }
}

class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      body: Container(
        child: CountryPickerWidget(
          onSelected: (country) => Navigator.pop(context, country),
        ),
      ),
    );
  }
}
