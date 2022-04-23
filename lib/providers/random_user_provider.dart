import 'dart:convert';

import 'package:get/get.dart';

class RandomUserProvider extends GetConnect {
  Future<String> getRandomName() async {
    var resp = (await get("https://randomuser.me/api/")).body;

    return resp['results'][0]['name']['first'] +
        ' ' +
        resp['results'][0]['name']['last'];
  }
}
