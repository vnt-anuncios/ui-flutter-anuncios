import 'package:anuncios_ui/app/data/provider/local/local_categoria.dart';
import 'package:get/get.dart';

class LocalCategoriaService {
  final LocalCategoria _localCategoria = Get.find<LocalCategoria>();
  Future<void> cargarCategoria() async {
    return _localCategoria.cargarCategoria();
  }

  get categoria => _localCategoria.categorias;
  get subCategoria => _localCategoria.subCategorias;
}
