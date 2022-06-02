import 'package:get/get.dart';

class FcmProvider extends GetConnect {
  postNotification(
      {required String to,
      required String secret,
      String? title,
      String? body}) async {
    var resp = await post("https://fcm.googleapis.com/fcm/send", {
      "to": to,
      "notification": {"title": title ?? "", "body": body ?? ""}
    }, headers: {
      "Authorization": "key=$secret"
    });

    print(resp.bodyString);
  }
}
