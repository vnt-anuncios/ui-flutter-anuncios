import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/utils/numero.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleCardItem extends StatelessWidget {
  final AnuncioDetails anuncios;

  const DetalleCardItem({
    Key? key,
    required this.anuncios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextCustomApp(
                    title: anuncios.anuncio.precio.toString() + " BS",
                    fontSize: 12.sp,
                    color: Colors.red,
                    weight: true,
                  ),
                  TextCustomApp(
                    title: anuncios.anuncio.titulo.toUpperCase(),
                    fontSize: 10.sp,
                    color: Colors.black,
                    weight: true,
                    maxLine: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextCustomApp(
                          title: anuncios.anuncio.descripcion,
                          fontSize: 11.sp,
                          color: Colors.black,
                          maxLine: 4,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12.sp,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                            child: TextCustomApp(
                              title: anuncios.anuncio.ubicacion,
                              fontSize: 11.sp,
                              color: Colors.grey.shade500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextCustomApp(
                              title: getDateFormat(
                                  anuncios.anuncio.fecha_publicacion),
                              fontSize: 10.sp,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          (anuncios.destacados != null)
                              ? Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  child: TextCustomApp(
                                    title: "destacado",
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                  // TextCustomApp(
                  //   title: "auto - 4 patas - 4 puertas - etx -  asjdfs - asdf",
                  //   color: Colors.grey.shade500,
                  //   fontSize: 11.sp,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        var whatsapp =
                            urlWhatssap(numero: anuncios.user.telefono);
                        if (await canLaunch(whatsapp)) {
                          await launch(whatsapp);
                        } else {
                          throw 'could nnot launch $whatsapp';
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 17.sp,
                      ),
                      label: Text("Contactar"),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        String numero = anuncios.user.telefono;
                        var telefono = llamar(numero: numero);
                        if (await canLaunch(telefono)) {
                          await launch(telefono);
                        } else {
                          throw 'could nnot launch $telefono';
                        }
                      },
                      icon: Icon(
                        Icons.phone_android_outlined,
                        size: 17.sp,
                      ),
                      label: Text("Llamar"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDateFormat(DateTime date) {
    return date.day.toString() +
        " - " +
        date.month.toString() +
        " - " +
        date.year.toString();
  }
}

class TextCustomApp extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final bool weight;
  final int maxLine;
  TextCustomApp({
    Key? key,
    required this.title,
    required this.color,
    required this.fontSize,
    this.weight: false,
    this.maxLine: 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: (weight) ? FontWeight.bold : FontWeight.normal,
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
