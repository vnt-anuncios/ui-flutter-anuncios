import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/provider/remote/anuncios/anuncios_details_provider.dart';
import 'package:get/get.dart';

class AnunciosDetailsService {
  final _anunciosDetailsProvider = Get.find<AnunciosDetailsProvider>();

  Future<List<AnuncioDetails>> getAnunciosDetails(String token) =>
      _anunciosDetailsProvider.getAnunciosDetails(token);
}
