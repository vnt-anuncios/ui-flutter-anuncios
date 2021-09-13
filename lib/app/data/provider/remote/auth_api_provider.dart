import 'dart:convert';

import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;

class AuthApiProvider {
  final String url = BaseUrl.BASE_URL_REMOTO + "requestTokenGoogle";

  requestTokenGoogle(String token, AndroidDeviceInfo info) async {
    try {
      print(token);
      String body = json.encode({"token": token, "device_name": info.id});
      var response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return [User.fromMap(data["user"]), data["access-token"]];
      } else {
        throw response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  logout(String token) async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await http.get(
        Uri.parse(BaseUrl.BASE_URL_REMOTO + "logout"),
        headers: header,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {}
  }
}
