import 'dart:io';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/provider/remote/anuncios/anuncios_details_provider.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:get/get.dart';

class AnunciosDetailsService {
  final _anunciosDetailsProvider = Get.find<AnunciosDetailsProvider>();

  Future<List<AnuncioDetails>> getAnunciosDetails(String token) =>
      _anunciosDetailsProvider.getAnunciosDetails(token);

  Future<bool> agregarAnuncio(
      List<File> photos, Anuncio anuncio, int id_categoria) async {
    String? token = await Get.find<LocalAuthService>().getSession();
    return _anunciosDetailsProvider.addAnuncio(
        photos, id_categoria, anuncio, token!);
  }
}
