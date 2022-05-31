import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RemoteConfigController extends GetxController {
  FirebaseRemoteConfig get config => FirebaseRemoteConfig.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (kDebugMode) {
      await config.ensureInitialized();

      await config.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 60),
          minimumFetchInterval: Duration.zero));
    }
    await config.fetchAndActivate();
  }

  String getDefaultImagePath() {
    return config.getString("default_image_path");
  }

  String getMessageTextFieldHint() {
    return config.getString("message_textfield_hint");
  }
}
