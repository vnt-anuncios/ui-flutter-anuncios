import 'dart:convert';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AnuncioDestacadosProvider {
  final _url = BaseUrl.BASE_URL_REMOTO + "destacados";

  getDestacados() async {
    try {
      var response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["data"] as List;
        List<AnuncioDetails> listFavorito = data.map<AnuncioDetails>((model) {
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
        return listFavorito;
      } else {
        throw response.statusCode;
      }
    } catch (e) {}
  }
}
