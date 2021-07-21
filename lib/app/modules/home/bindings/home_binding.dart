import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print("dependencias de home");
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AnunciosSearchController>(
      () => AnunciosSearchController(),
      fenix: false,
    );
  }
}
