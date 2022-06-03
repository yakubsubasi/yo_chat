import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

                try {
                  await userDoc!.update(name: _nameController.text);
                  final name = (await userDoc!.get()).data!;

                  final snackBar = SnackBar(
                    content: Text(
                        'Kullanıcı ${name.displayName} adınız değiştirildi!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } catch (e) {
                  const snackBar = SnackBar(
                    content: Text('Bir hata oluştu!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            ElevatedButton(
              child: Text('Update Profile Image'),
              onPressed: () async {
                try {
                  var picker = ImagePicker();
                  var image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  var uid = authController.user.value?.uid;
                  if (uid == null) return;

                  final loadingSnackBar = SnackBar(
                    content: Row(
                      children: [
                        CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 15),
                        const Text('Profil Resminiz Değiştiriliyor'),
                      ],
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(loadingSnackBar);

                  var imageBytes = await image.readAsBytes();

                  var upload = await FirebaseStorage.instance
                      .ref("profile_image/$uid/image.jpg")
                      .putData(imageBytes);

                  var path = await upload.ref.getDownloadURL();

                  await userDoc!.update(photoUrl: path);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  const snackBar = SnackBar(
                    content: Text('Profil Resminiz değiştirildi!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } catch (e) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  const snackBar = SnackBar(
                    content: Text('Bir hata oluştu!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
