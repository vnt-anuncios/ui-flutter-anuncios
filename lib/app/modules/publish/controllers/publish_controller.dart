import 'dart:io';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/services/remoto/anuncios/anuncios_details_service.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

class PublishController extends GetxController {
  List<Asset> _images = <Asset>[];

  final AnunciosDetailsService _anunciosDetailsService =
      Get.find<AnunciosDetailsService>();

  List<Asset> get image => _images;
  set image(image) => _images = image;

  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  String titulo = "";
  double precio = 0.0;
  String condicion = "";
  String ubicacion = "";
  String enlace = "";
  String descripcion = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  publicar() async {
    try {
      _isLoading.value = true;
      int id_categoria =
          Get.find<AnunciosSearchController>().selectCategoria.value;
      List<File> fileImageArray = [];
      _images.forEach((element) async {
        final File filePath = await getImageFromAssets(element);
        fileImageArray.add(filePath);

        if (fileImageArray.length == _images.length) {
          print(fileImageArray.toString());
          bool succes = await _anunciosDetailsService.agregarAnuncio(
              fileImageArray,
              Anuncio(
                titulo: this.titulo,
                precio: this.precio,
                fecha_publicacion: DateTime.now(),
                condicion: this.condicion,
                ubicacion: this.ubicacion,
                descripcion: this.descripcion,
                enlace: this.enlace,
              ),
              id_categoria);
          if (succes) {
            _isLoading.value = false;
            Get.back();
            Get.toNamed(Routes.MIS_ANUNCIOS);
          }
        }
      });
    } catch (e) {}
  }

  Future<File> getImageFromAssets(Asset image) async {
    final byteData = await image.getByteData();

    final tempFile =
        File("${(await getTemporaryDirectory()).path}/${image.name}");
    final file = await tempFile.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );
    return file;
  }

  @override
  void onClose() {}
}
