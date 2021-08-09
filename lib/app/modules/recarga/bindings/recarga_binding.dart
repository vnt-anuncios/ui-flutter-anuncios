import 'package:get/get.dart';

import '../controllers/recarga_controller.dart';

class RecargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecargaController>(
      () => RecargaController(),
    );
  }
}
