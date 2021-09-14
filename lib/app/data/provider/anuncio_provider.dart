import 'dart:convert';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AnuncioProvider {
  final Uri url = Uri.parse(BaseUrl.BASE_URL_REMOTO + "anuncios/");

  AnuncioProvider() {}

  getAnuncios() async {
    print("llego");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body)['data'] as List;
        List<Anuncio> listAnuncio = jsonResponse
            .map(
              (e) => Anuncio.fromMap(e),
            )
            .toList();
        return listAnuncio;
        // List<Anuncio> listAnuncio =
        //     jsonResponse.map((model) => Anuncio.fromJson(model)).toList();
        // print(listAnuncio.toString());
        // return listAnuncio;
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
