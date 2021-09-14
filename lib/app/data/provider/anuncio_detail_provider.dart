import 'dart:convert';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AnuncioDetailProvider {
  final String URL = BaseUrl.BASE_URL_REMOTO + URL_DETAIL.anuncio;

  Future<List<AnuncioDetails>> getAnuncioDetail() async {
    var response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"] as List;
      List<AnuncioDetails> listAnuncios = data.map<AnuncioDetails>((model) {
        List<Foto> fotos =
            model["fotos"].map<Foto>((e) => Foto.fromMap(e)).toList();
        bool isFavorito = model["favoritos"].length > 0 ? true : false;

        return AnuncioDetails(
          Anuncio.fromMap(model),
          fotos,
          User.fromMap(model["user"]),
          isFavorito,
          Categoria.fromMap(model["categoria"]),
          null,
        );
      }).toList();
      return listAnuncios;
    } else {
      throw response.body;
    }
  }
}

class URL_DETAIL {
  static String anuncio = "anuncios/";
  static String anuncioUser = "/user/";
  static String categoria = "/categoria/";
  static String destacado = "/destacado/";
  static String isFavorito = "/isfavorito/";
}
