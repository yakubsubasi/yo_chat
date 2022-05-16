import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              SizedBox(height: 100),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.onCountryPickerPressed();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Pick Country'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        errorText: controller.phoneNumberError.value,
                        labelText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        controller.phoneNumber.value = value;
                      },
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    TextButton(
                        onPressed: () {},
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
