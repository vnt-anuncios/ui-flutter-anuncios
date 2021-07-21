import 'package:get/get.dart';

class AnunciosSearchController extends GetxController {
  final categoriaSelect = 0.obs;
  final subCategoriaSelect = 0.obs;

  @override
  void onInit() {
    super.onInit();
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
