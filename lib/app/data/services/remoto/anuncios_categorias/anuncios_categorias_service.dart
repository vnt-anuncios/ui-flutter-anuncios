import 'package:anuncios_ui/app/data/provider/remote/anuncios_categorias/anuncio_categoria_provider.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:get/get.dart';

class AnunciosCategoriaService {
  final _anunciosCategorias = Get.find<AnunciosCategoriaProvider>();

  getAnunciosCategoria(int index) async {
    String? token = await Get.find<LocalAuthService>().getSession();
    return (token != null)
        ? _anunciosCategorias.getAnunciosCategorias(index, token)
        : [];
  }
}
