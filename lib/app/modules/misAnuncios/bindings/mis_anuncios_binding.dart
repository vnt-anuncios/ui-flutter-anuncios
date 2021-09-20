import 'package:get/get.dart';

import '../controllers/mis_anuncios_controller.dart';

class MisAnunciosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisAnunciosController>(
      () => MisAnunciosController(),
    );
  }
}
