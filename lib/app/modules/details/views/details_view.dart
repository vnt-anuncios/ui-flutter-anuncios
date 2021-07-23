import 'package:anuncios_ui/app/global/lista_anuncios.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/anuncios_search_view.dart';
import 'package:anuncios_ui/app/modules/details/views/components/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';
import 'package:sizer/sizer.dart';

class DetailsView extends GetView<DetailsController> {
  final Anuncios _anuncio = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.green,
            size: 18.sp,
          ),
        ),
        title: Text(
          'Detalle Del anuncio',
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 5.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageSlider(images: _anuncio.images),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextCustomApp(
                              title: _anuncio.title.toUpperCase(),
                              color: Colors.black,
                              fontSize: 11.sp,
                            ),
                            SizedBox(
                              height: 0.7.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey.shade500,
                                  size: 11.5.sp,
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                TextCustomApp(
                                  title: _anuncio.date.toIso8601String(),
                                  color: Colors.grey.shade500,
                                  fontSize: 11.sp,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.7.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 11.5.sp,
                                  color: Colors.grey.shade500,
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                TextCustomApp(
                                  title: _anuncio.ubicacion,
                                  color: Colors.grey.shade500,
                                  fontSize: 11.sp,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.7.h,
                            ),
                            TextCustomApp(
                              title: _anuncio.precio.toString() + " Bs",
                              color: Colors.green,
                              fontSize: 13.sp,
                              weight: true,
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              indent: 0.0,
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 4.2.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.exclamationTriangle,
                                      size: 11.5.sp,
                                    ),
                                    label: Text(
                                      "Denunciar",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.heart,
                                      size: 11.5.sp,
                                    ),
                                    label: Text(
                                      " agregar a favorito",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade400, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          runSpacing: 0.5.h,
                          children: [
                            TextCustomApp(
                              title: "Descripcion",
                              color: Colors.black,
                              fontSize: 11.sp,
                              weight: true,
                            ),
                            Row(
                              children: [
                                TextCustomApp(
                                  title: "Categoria: ",
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  weight: true,
                                ),
                                TextCustomApp(
                                    title: _anuncio.categoria,
                                    color: Colors.black,
                                    fontSize: 11.sp),
                              ],
                            ),
                            Row(
                              children: [
                                TextCustomApp(
                                  title: "Fecha: ",
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  weight: true,
                                ),
                                TextCustomApp(
                                    title: _anuncio.date.toString(),
                                    color: Colors.black,
                                    fontSize: 11.sp),
                              ],
                            ),
                            Row(
                              children: [
                                TextCustomApp(
                                  title: "Precio: ",
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  weight: true,
                                ),
                                TextCustomApp(
                                    title: _anuncio.precio.toString(),
                                    color: Colors.black,
                                    fontSize: 11.sp),
                              ],
                            ),
                            Row(
                              children: [
                                TextCustomApp(
                                  title: "Condicion: ",
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  weight: true,
                                ),
                                TextCustomApp(
                                    title: "Nuevo",
                                    color: Colors.black,
                                    fontSize: 11.sp),
                              ],
                            ),
                            Row(
                              children: [
                                TextCustomApp(
                                  title: "Location: ",
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  weight: true,
                                ),
                                TextCustomApp(
                                    title: _anuncio.ubicacion,
                                    color: Colors.black,
                                    fontSize: 11.sp),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              _anuncio.descripcion,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: SizedBox(
                height: 5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 17.sp,
                      ),
                      label: Text(
                        "Contactar",
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.mobileAlt,
                        size: 17.sp,
                      ),
                      label: Text(
                        "Llamar",
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextCustom extends StatelessWidget {
  const RichTextCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: "hola mundo: como estas", children: []));
  }
}
