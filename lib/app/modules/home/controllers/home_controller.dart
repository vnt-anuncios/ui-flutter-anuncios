import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/anuncio_destacados_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/anuncios/anuncios_details_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/favoritos/favoritos_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AnunciosDetailsService _anunciosDetailService =
      Get.find<AnunciosDetailsService>();
  final AnuncioDestacadoService _anunciosDestacadoService;
  final FavoritosService _favoritosService = Get.find<FavoritosService>();

  List<AnuncioDetails> listAnuncioDetails = [];
  List<AnuncioDetails> listAnuncioDestacados = [];

  HomeController(this._anunciosDestacadoService);

  RxBool loading = false.obs;
  RxBool loadingDestacados = false.obs;
  get isLoading => loading.value;
  get isLoadingDestacados => loadingDestacados.value;

  RxInt indexRx = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAnuncios();
    getAnunciosDestacados();
  }

  getAnuncios() async {
    loading.value = true;
    String? token = await Get.find<LocalAuthService>().getSession();
    this._anunciosDetailService.getAnunciosDetails(token!).then((data) {
      listAnuncioDetails = data;
      loading.value = false;
    });
  }

  getAnunciosDestacados() {
    loadingDestacados.value = true;
    this._anunciosDestacadoService.getAnunciosDestacados().then((data) {
      print(data);
      listAnuncioDestacados = data;
      loadingDestacados.value = false;
    });
  }

  change(int index) {
    indexRx.value = index;
  }

  addFavorito(int index, int anuncio_id) async {
    try {
      bool success = await _favoritosService.addFavoritos(anuncio_id);
      if (success) {
        listAnuncioDetails[index].isFavorito = true;
        update([index]);
      }
    } catch (e) {}
  }

  deleteFavorito(index, int anuncio_id) async {
    try {
      bool success = await _favoritosService.deleteFavoritos(anuncio_id);
      if (success) {
        listAnuncioDetails[index].isFavorito = false;
        update([index]);
      }
    } catch (e) {}
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
