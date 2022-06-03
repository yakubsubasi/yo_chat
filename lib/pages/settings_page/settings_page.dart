import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/widgets/profile_image.dart';

import '../../providers/firebase_authentication_provider.dart';
import '../../providers/firestore_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var userDoc = Get.find<FirestoreProvider>().currentUserDoc;

  TextEditingController _nameController = TextEditingController();

  final authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    // build a profile settings page
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(
                    photoURL: authController.user.value?.photoUrl,
                  ),
                  SizedBox(width: 30),
                  Text(
                    authController.user.value?.displayName ?? "",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),

            SizedBox(height: 16),

            // change user name button

            ElevatedButton(
              child: Text('Change Username'),
              onPressed: () async {
                // change user name

                await userDoc!.update(name: _nameController.text);
                final name = (await userDoc!.get()).data!;

                final snackBar = SnackBar(
                  content: Text(
                      'Kullanıcı ${name.displayName} adınız değiştirildi!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
