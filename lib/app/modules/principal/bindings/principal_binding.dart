import 'package:get/get.dart';

import '../controllers/principal_controller.dart';

class PrincipalBinding extends Bindings {
  @override
  void dependencies() {
    print("se creo la dependencia");
    Get.lazyPut<PrincipalController>(
      () => PrincipalController(),
    );
  }
}
