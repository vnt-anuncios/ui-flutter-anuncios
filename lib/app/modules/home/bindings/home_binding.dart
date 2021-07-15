import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print("dependencias de home");
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
