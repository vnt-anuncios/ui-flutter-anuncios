import 'dart:convert';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AnunciosDetailsProvider {
  AnunciosDetailsProvider();

  String url = BaseUrl.BASE_URL_REMOTO + "anunciosdetails";

  Future<List<AnuncioDetails>> getAnunciosDetails(String token) async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await http.get(Uri.parse(url), headers: header);
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
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
