import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/services/local/local_categoria_service.dart';
import 'package:get/get.dart';

class CategoriaController extends GetxController {
  final localCategoria = Get.find<LocalCategoriaService>();
  List<Categoria> categoria = Get.find<LocalCategoriaService>().categoria;
  Map<int, List<Categoria>> subCategoria =
      Get.find<LocalCategoriaService>().subCategoria;
  @override
  void onInit() {
    print(subCategoria.toString());
  }
}
