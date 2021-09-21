import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/services/remoto/anuncios/anuncios_details_service.dart';
import 'package:get/get.dart';

class MisAnunciosController extends GetxController {
  final _anuncioService = Get.find<AnunciosDetailsService>();

  List<AnuncioDetails> _misAnuncios = [];
  List<AnuncioDetails> get misAnuncios => _misAnuncios;

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  
  @override
  void onInit() {
    getMisAnuncios();
    super.onInit();
  }

  getMisAnuncios() async {
    _isLoading.value = true;
    _misAnuncios = await _anuncioService.misAnuncios();
    _isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
