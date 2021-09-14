import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/categoria_anuncio_service.dart';
import 'package:get/get.dart';

class AnunciosSearchController extends GetxController {
  final CategoriaAnuncioService _categoriaAnuncioService;
  AnunciosSearchController(this._categoriaAnuncioService);

  //atributos
  final categoriaSelect = 0.obs;
  final subCategoriaSelect = 0.obs;
  List<AnuncioDetails> _listAnuncios = [];
  RxBool _isLoading = false.obs;
  //end Atributos

  //metodos
  List<AnuncioDetails> get listAnuncio => _listAnuncios;
  get loading => this._isLoading.value;

  @override
  void onInit() {
    super.onInit();
    getAnunciosDetails();
  }

  getAnunciosDetails() {
    this._isLoading.value = true;
    this._categoriaAnuncioService.getAnuncioOrderByDestacados().then((data) {
      _listAnuncios = data;
      this._isLoading.value = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dispose();
  }

  void increment(Object val) {
    categoriaSelect.value = (val) as int;
    update(["showModal"]);
  }

  void change(Object sub) {
    subCategoriaSelect.value = sub as int;
    update(["showModal"]);
  }
}
