import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider extends GetxService {
  late SharedPreferences sp;

  @override
  Future<void> onInit() async {
    super.onInit();
    sp = await SharedPreferences.getInstance();
  }

  void writeFCM(String fcm) {
    sp.setString("fcm", fcm);
  }

  void writeFCMTime(DateTime time) {
    sp.setString("fcm_time", time.toIso8601String());
  }

  void writeFCMuid(String uid) {
    sp.setString("fcm_uid", uid);
  }

  String? readFCM() {
    return sp.getString("fcm");
  }

  String? readFCMuid() {
    return sp.getString("fcm_uid");
  }

  DateTime? readFCMTime() {
    var timeString = sp.getString("fcm_time");
    if (timeString == null) return null;
    return DateTime.tryParse(timeString);
  }
}
