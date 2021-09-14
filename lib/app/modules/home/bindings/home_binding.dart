import 'package:anuncios_ui/app/data/provider/anuncio_destacados_provider.dart';
import 'package:anuncios_ui/app/data/provider/anuncio_detail_provider.dart';
import 'package:anuncios_ui/app/data/provider/categoria_anuncio_provider.dart';
import 'package:anuncios_ui/app/data/services/anuncio_destacados_service.dart';
import 'package:anuncios_ui/app/data/services/categoria_anuncio_service.dart';
import 'package:anuncios_ui/app/global/logout/logout_controller.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        AnuncioDestacadoService(
          AnuncioDestacadosProvider(),
        ),
      ),
    );
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
