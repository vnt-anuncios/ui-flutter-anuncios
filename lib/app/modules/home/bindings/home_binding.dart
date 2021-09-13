import 'package:anuncios_ui/app/data/provider/anuncio_destacados_provider.dart';
import 'package:anuncios_ui/app/data/provider/anuncio_detail_provider.dart';
import 'package:anuncios_ui/app/data/provider/categoria_anuncio_provider.dart';
import 'package:anuncios_ui/app/data/services/anuncio_destacados_service.dart';
import 'package:anuncios_ui/app/data/services/anuncio_detail_service.dart';
import 'package:anuncios_ui/app/data/services/categoria_anuncio_service.dart';
import 'package:anuncios_ui/app/global/logout/logout_controller.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print("dependencias de home");
    Get.lazyPut<HomeController>(
      () => HomeController(
        AnuncioDetailService(
          anuncioDetailProvider: AnuncioDetailProvider(),
        ),
        AnuncioDestacadoService(
          AnuncioDestacadosProvider(),
        ),
      ),
    );
    //dependencias para el search controller
    Get.lazyPut<AnunciosSearchController>(
      () => AnunciosSearchController(
        CategoriaAnuncioService(
          CategoriaAnuncioProvider(),
          AnuncioDetailProvider(),
        ),
      ),
      fenix: false,
    );
    Get.lazyPut<LogoutController>(() => LogoutController());
  }
}
