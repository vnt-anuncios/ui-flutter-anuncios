import 'dart:convert';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/destacado.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AnunciosCategoriaProvider {
  final String url = BaseUrl.BASE_URL_REMOTO + "categoria/";
  final String anuncios = "/anuncios";

  getAnunciosCategorias(int index, String token) async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await http
          .get(Uri.parse(url + index.toString() + anuncios), headers: header);
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
            (model["destacado"] != null)
                ? Destacado.fromMap(model["destacado"])
                : null,
          );
        }).toList();
        return listAnuncios;
      } else {
        throw response.body;
      }
    } catch (e) {}
  }
}
