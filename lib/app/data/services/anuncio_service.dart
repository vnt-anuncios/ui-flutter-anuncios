import 'package:anuncios_ui/app/data/provider/anuncio_provider.dart';
import 'package:get/get.dart';

class AnunciosService extends GetxService {
  final AnuncioProvider anuncioProvider;

  AnunciosService({required this.anuncioProvider});

  Future<AnunciosService> init() async {
    return this;
  }

  getAnuncios() {
    return anuncioProvider.getAnuncios();
  }
}
