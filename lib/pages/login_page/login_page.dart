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
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * .2),
                Obx(
                  () => SizedBox(
                    height: constraints.maxHeight * .8,
                    child: Form(
                      child: Column(
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
                            autovalidateMode: AutovalidateMode.disabled,
                            initialCountryCode: 'TR',
                            onChanged: (phone) {
                              controller.phoneNumber.value = phone.number;
                              controller.countryCode.value = phone.countryCode;
                              //phone.print(phone.completeNumber);
                            },
                          ),
                          Spacer(),
                          Builder(builder: (context) {
                            return TextButton(
                              onPressed: () {
                                if (Form.of(context)!.validate()) {
                                  controller.login();
                                }
                              },
                              child: Text('Next'),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.teal),
                              ),
                            );
                          }),
                          SizedBox(
                            height: constraints.maxHeight * .1,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
