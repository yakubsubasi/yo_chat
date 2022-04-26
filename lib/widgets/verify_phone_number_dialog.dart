import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneNumberDialog extends StatelessWidget {
  VerifyPhoneNumberDialog({Key? key}) : super(key: key);

  final code = "".obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Doğrulama Kodu Gönderildi"),
        TextField(
          decoration: InputDecoration(labelText: "Doğrulama Kodu"),
          onChanged: (String text) {
            code.value = text;
          },
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: code.value);
          },
          child: Text("Doğrula"),
        )
      ],
    );
  }
}
