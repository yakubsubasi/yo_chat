import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/pages/verify_phone_number_page/verify_phone_number_controller.dart';
import 'package:yo_chat/widgets/verify_phone_number_dialog.dart';

class VerifyPhoneNumberPage extends StatelessWidget {
  const VerifyPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put<VerifyPhoneNumberController>(VerifyPhoneNumberController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => controller.code.value = value,
          ),
          ElevatedButton(
              onPressed: () {
                Get.back(result: controller.code.value);
              },
              child: const Text('Verify'))
        ],
      ),
    );
  }
}
