import 'package:anuncios_ui/app/global/loading/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

import '../controllers/publish_controller.dart';
import 'package:sizer/sizer.dart';

class PublishView extends GetWidget<PublishController> {
  // final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Publicar',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 25.h,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(),
                        ),
                        child: GetBuilder<PublishController>(
                          id: "image",
                          builder: (_) {
                            return CarouselSlider(
                              items: getImage(),
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 2,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                height: 30.h,
                                onPageChanged: (index, reason) {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            controller.image =
                                await MultiImagePicker.pickImages(
                              maxImages: 5,
                              enableCamera: true,
                              selectedAssets: controller.image,
                              materialOptions:
                                  MaterialOptions(allViewTitle: "Mostrar Todo"),
                            );
                            controller.update(["image"]);
                          } catch (e) {}
                        },
                        child: Container(
                          child: Center(
                            child: Text("Cargar imagen"),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(50)
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText: "Titulo",
                                      labelText: "Titulo",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.titulo = value;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText: "Precio",
                                      labelText: "Precio",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.precio = double.parse(value);
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15),
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText: "nuevo-usado-de segunda-mano",
                                      labelText: "Condición",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.condicion = value;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText:
                                          "agregar ubicacion de la tienda o del producto",
                                      labelText: "Ubicación",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.ubicacion = value;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    keyboardType: TextInputType.url,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText: "Enlace",
                                      labelText: "Enlace",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.enlace = value;
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: TextFormField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2.h, horizontal: 2.w),
                                      hintText:
                                          "descripcion detallada del producto",
                                      labelText: "Descripción",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 0.3.w,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.descripcion = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 20.w),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      try {
                                        controller.publicar();
                                        print(
                                            controller.image.first.identifier);
                                        print(
                                            controller.image.first.identifier);
                                      } catch (e) {}
                                    },
                                    child: Text("Agregar Anuncio"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() => (controller.isLoading) ? Loading() : Container()),
        ],
      ),
    );
  }

  getImage() {
    if (controller.image.isEmpty)
      return [
        Image.asset(
          "assets/img/image_not_found.png",
          fit: BoxFit.fill,
        ),
      ];
    return controller.image
        .map(
          (item) => Container(
            //margin: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: [
                  AssetThumb(
                    asset: item,
                    width: 100.w.toInt(),
                    height: 25.h.toInt(),
                  ),
                  // FadeInImage.assetNetwork(
                  //   fit: BoxFit.fill,
                  //   placeholder: "assets/img/loading.gif",
                  //   image: item.enlace,
                  //   width: 100.w,
                  // ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
