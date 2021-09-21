import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/provider/remote/categorias/categorias_provider.dart';
import 'package:get/get.dart';

class CategoriasService {
  final CategoriaProvider _categoriasProvider = Get.find<CategoriaProvider>();
  Future<Map<int, List<Categoria>>> getCategorias() {
    return _categoriasProvider.getCategorias();
  }
}
