import 'package:get/get.dart';

import '../controllers/categoria_controller.dart';

class CategoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriaController>(
      () => CategoriaController(),
    );
  }
}
