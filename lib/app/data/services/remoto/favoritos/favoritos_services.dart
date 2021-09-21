import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/provider/remote/favoritos/favoritos_provider.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:get/get.dart';

class FavoritosService {
  final FavoritosProvider _favoritosProvider = Get.find<FavoritosProvider>();

  Future<List<AnuncioDetails>> getFavoritos() async {
    String? token = await Get.find<LocalAuthService>().getSession();
    if (token != null) {
      return _favoritosProvider.getFavoritos(token);
    }
    return [];
  }

  Future<bool> addFavoritos(int anuncio_id) async {
    String? token = await Get.find<LocalAuthService>().getSession();
    if (token != null) {
      return _favoritosProvider.addFavorito(token, anuncio_id);
    }
    return false;
  }

  Future<bool> deleteFavoritos(int anuncio_id) async {
    String? token = await Get.find<LocalAuthService>().getSession();
    if (token != null) {
      return _favoritosProvider.deleteFavorito(token, anuncio_id);
    }
    return false;
  }
}
