import 'dart:convert';
import 'dart:io';
import 'dart:async';

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

  Future<bool> addAnuncio(
    List<File> photos,
    int id_categoria,
    Anuncio anuncio,
    String token,
  ) async {
    final String url = BaseUrl.BASE_URL_REMOTO + "agregarAnuncio";

    var header = {
      'Content-Type': 'multipart/form-data',
      //'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      //agregando las imagenes
      int i = 0;
      List<http.MultipartFile> files = [];
      for (var photo in photos) {
        String fileName = photo.path.split("/").last;
        var stream = http.ByteStream(photo.openRead())..cast();
        var length = await photo.length();

        var multiPartFileSign =
            http.MultipartFile("fotos$i", stream, length, filename: fileName);
        files.add(multiPartFileSign);
        i += 1;
      }
      request.files.addAll(files);
      request.headers.addAll(header);

      request.fields['anuncio'] = anuncio.toJson();
      request.fields['id_categoria'] = id_categoria.toString();

      var response = await request.send();
      var res = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }
}
