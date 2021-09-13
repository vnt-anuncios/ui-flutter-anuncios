import 'dart:convert';

import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String url = BaseUrl.BASE_URL_REMOTO + "user/";

  Future<User?> saveTelefono(int id, String numero, String token) async {
    try {
      String body = json.encode({
        "telefono": numero,
      });

      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await http.post(
          Uri.parse(url + id.toString() + "/telefono"),
          headers: header,
          body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        User? user = User.fromMap(data["data"]);
        return user == null ? null : user;
      }
    } catch (e) {}
  }
}
