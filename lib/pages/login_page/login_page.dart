import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yo_chat/pages/login_page/login_page.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<LoginPageController>(LoginPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify phone number'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 200),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IntlPhoneField(
                      decoration: InputDecoration(
                        errorText: controller.phoneNumberError.value,
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'TR',
                      onChanged: (phone) {
                        controller.phoneNumber.value = phone.toString();
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(height: 350),
                    TextButton(
                        onPressed: () {
                          controller.login();
                        },
                        child: Text('Next'),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal))),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
