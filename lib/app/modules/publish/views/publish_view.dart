import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

import '../controllers/publish_controller.dart';

class PublishView extends GetWidget<PublishController> {
  // final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Publicar',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFECF7E5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  controller.image = await MultiImagePicker.pickImages(
                    maxImages: 5,
                    enableCamera: true,
                    selectedAssets: controller.image,
                  );
                  // List<XFile>? photos = await _picker.pickMultiImage();
                  // controller.image = photos;
                  // print(photos!.first.path);
                } catch (e) {}
              },
              child: Container(
                child: Center(
                  child: Text("Cargar imagen"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  controller.publicar();
                  print(controller.image.first.identifier);
                  print(controller.image.first.identifier);
                } catch (e) {}
              },
              child: Text("fotos"),
            ),
          ],
        ),
      ),
    );
  }
}
