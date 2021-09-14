import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/anuncio_destacados_service.dart';
import 'package:anuncios_ui/app/data/services/anuncio_detail_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AnuncioDetailService _anunciosDetailService;
  final AnuncioDestacadoService _anunciosDestacadoService;

  List<AnuncioDetails> listAnuncioDetails = [];
  List<AnuncioDetails> listAnuncioDestacados = [];

  HomeController(this._anunciosDetailService, this._anunciosDestacadoService);

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

  getAnuncios() {
    loading.value = true;
    this._anunciosDetailService.getAnuncioDetail().then((data) {
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

  @override
  void onReady() {}

  @override
  void onClose() {}
}
