import 'package:get/get.dart';

import '../controllers/anuncios_search_controller.dart';

class AnunciosSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnunciosSearchController>(
      () => AnunciosSearchController(),
    );
  }
}
