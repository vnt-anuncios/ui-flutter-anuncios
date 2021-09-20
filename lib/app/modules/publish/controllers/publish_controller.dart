import 'dart:io';

import 'package:anuncios_ui/app/data/models/anuncio.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/services/remoto/anuncios/anuncios_details_service.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

class PublishController extends GetxController {
  List<Asset> _images = <Asset>[];

  final AnunciosDetailsService _anunciosDetailsService =
      Get.find<AnunciosDetailsService>();

  List<Asset> get image => _images;
  set image(image) => _images = image;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  publicar() async {
    List<File> fileImageArray = [];
    _images.forEach((element) async {
      final File filePath = await getImageFromAssets(element);
      fileImageArray.add(filePath);

      if (fileImageArray.length == _images.length) {
        print(fileImageArray.toString());
        bool succes = await _anunciosDetailsService.agregarAnuncio(
            fileImageArray,
            Anuncio(
              titulo: "vendedor de amburgesas",
              precio: 0,
              fecha_publicacion: DateTime.now(),
              condicion: "supernuevo",
              ubicacion: "aqui",
              descripcion:
                  "asdfaskjdhfkjalsjfljasbkfjaslkjfbalkjsfkjasfjkashfkjaslfhaskfhgaslkjf",
              enlace: "url",
            ),
            2);
      }
    });
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

  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    print("testCompressAndGetFile");
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 30,
      minWidth: 1024,
      minHeight: 1024,
      // rotate: 90,
    );

    return result!;
  }
}
