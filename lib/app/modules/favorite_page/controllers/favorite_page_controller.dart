import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/remoto/favoritos/favoritos_services.dart';
import 'package:get/get.dart';

class FavoritePageController extends GetxController {
  final _favoritosService = Get.find<FavoritosService>();

  List<AnuncioDetails> _anunciosFavoritos = [];

  RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  List<AnuncioDetails> get favoritos => _anunciosFavoritos;

  @override
  void onInit() {
    super.onInit();
    loadFavoritos();
  }

  loadFavoritos() async {
    try {
      _isLoading.value = true;
      _anunciosFavoritos = await _favoritosService.getFavoritos();
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
    }
  }

  Future<void> refresh() async {
    _anunciosFavoritos = await _favoritosService.getFavoritos();
    update(["listFavorite"]);
  }

  deleteFavorito(int index, int id) async {
    try {
      bool successful = await _favoritosService.deleteFavoritos(id);
      if (successful) {
        _anunciosFavoritos.removeAt(index);

        update(['listFavorite']);
      }
      return successful;
    } catch (e) {
      _isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
