import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/categoria_anuncio_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/anuncios_categorias/anuncios_categorias_service.dart';
import 'package:get/get.dart';

class AnunciosSearchController extends GetxController {
  final CategoriaAnuncioService _categoriaAnuncioService;
  final AnunciosCategoriaService _anuncioCategoria =
      Get.find<AnunciosCategoriaService>();
  AnunciosSearchController(this._categoriaAnuncioService);

  double _precioBegin = 0;
  double _precioEnd = 0;

  int _categoria_id = 0;

  //atributos
  final categoriaSelect = 0.obs;
  final subCategoriaSelect = 0.obs;
  List<AnuncioDetails> _listAnuncios = [];
  RxBool _isLoading = false.obs;

  final selectCategoria = 0.obs;

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

  getAnuncioCategoria(int categoria) async {
    this._isLoading.value = true;
    _listAnuncios = await _anuncioCategoria.getAnunciosCategoria(categoria);
    this._isLoading.value = false;
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
    subCategoriaSelect.value = 0;

    categoriaSelect.value = (val) as int;
    _categoria_id = categoriaSelect.value;
    update(["showModal"]);
  }

  void change(Object sub) {
    subCategoriaSelect.value = sub as int;
    _categoria_id = subCategoriaSelect.value;
    update(["showModal"]);
  }

  searchRemote() {
    this._isLoading.value = true;
    this._anuncioCategoria.getAnunciosCategoria(_categoria_id).then((data) {
      _listAnuncios = data;
      this._isLoading.value = false;
    }).catchError((onError) {
      print(onError);
      this._isLoading.value = false;
    });
  }
}
