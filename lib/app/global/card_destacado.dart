import 'dart:math';

import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/global/my_image_network.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardDestacado extends StatelessWidget {
  final AnuncioDetails anuncio;
  final VoidCallback onPress;
  CardDestacado({Key? key, required this.anuncio, required this.onPress})
      : super(key: key);

  Positioned etiqueta(
      {required String text, required Color color, required Color textColor}) {
    return Positioned(
      left: 0,
      top: 1.h,
      child: Container(
        //height: 2.h,
        padding: EdgeInsets.all(3),
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 8.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: InkWell(
        onTap: this.onPress,
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          child: SizedBox(
            width: 40.w,
            child: Stack(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /*SvgPicture.asset(
                        "assets/img/login.svg",
                        height: 17.h,
                        fit: BoxFit.fill,
                      ),*/
                      Container(
                        height: 17.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75),
                            ),
                          ],
                        ),
                        child: MyImageNetWork(fotos: anuncio.fotos),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  anuncio.anuncio.precio.toString() + " Bs",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  anuncio.anuncio.titulo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 12.sp,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      anuncio.anuncio.ubicacion,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                etiqueta(
                  text: "Destacado",
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
