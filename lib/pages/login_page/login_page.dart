import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yo_chat/pages/login_page/login_page.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<LoginPageController>(LoginPageController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Yo App'),
        ),
        body: Column(
          children: [
            const Text('Login Page'),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                controller.phoneNumber.value = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text('Login'))
          ],
        ));
  }
}
