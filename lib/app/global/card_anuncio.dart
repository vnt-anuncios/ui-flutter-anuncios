import 'dart:math';
import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/global/my_image_network.dart';
import 'package:anuncios_ui/app/utils/numero.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CardAnuncio extends StatefulWidget {
  final AnuncioDetails anuncioDetails;
  final VoidCallback onPress;
  CardAnuncio({
    Key? key,
    required this.anuncioDetails,
    required this.onPress,
  }) : super(key: key);

  @override
  _CardAnuncioState createState() => _CardAnuncioState();
}

class _CardAnuncioState extends State<CardAnuncio>
    with AutomaticKeepAliveClientMixin {
  Container _buildImage(List<Foto> listImage) {
    return Container(
      width: 30.w,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MyImageNetWork(fotos: listImage),
            ),
          ),
          Positioned(
            bottom: 1.h,
            left: 1.w,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    listImage.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return SizedBox(
      height: 17.h,
      child: Card(
        child: InkWell(
          onTap: widget.onPress,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                _buildImage(widget.anuncioDetails.fotos),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Container(
                      child: Stack(
                        children: [
                          Favorito(
                            favo: false,
                            onChange: (value) {
                              print(
                                  "on Press card anuncios" + value.toString());
                            },
                          ),
                          Positioned.fill(
                            child: Container(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.anuncioDetails.anuncio.precio
                                                  .toString() +
                                              "  Bs",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget
                                                .anuncioDetails.anuncio.titulo,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.grey.shade400,
                                              size: 12.sp,
                                            ),
                                            Text(
                                              widget.anuncioDetails.anuncio
                                                  .ubicacion,
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.centerRight,
                                      height: 5.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () async {
                                              var whatsapp = urlWhatssap(
                                                  numero: widget.anuncioDetails
                                                      .user.telefono!);
                                              if (await canLaunch(whatsapp)) {
                                                await launch(whatsapp);
                                              } else {
                                                throw 'could nnot launch $whatsapp';
                                              }
                                            },
                                            icon:
                                                Icon(FontAwesomeIcons.whatsapp),
                                            label: Text("Contactar"),
                                          ),
                                          TextButton.icon(
                                            onPressed: () async {
                                              String numero = widget
                                                  .anuncioDetails
                                                  .user
                                                  .telefono!;

                                              var telefono =
                                                  llamar(numero: numero);
                                              if (await canLaunch(telefono)) {
                                                await launch(telefono);
                                              } else {
                                                throw 'could nnot launch $telefono';
                                              }
                                            },
                                            icon: Icon(Icons.phone_android),
                                            label: Text("LLamar"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
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
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: must_be_immutable
class Favorito extends StatefulWidget {
  bool favo;
  final ValueChanged onChange;
  Favorito({
    Key? key,
    required this.favo,
    required this.onChange,
  }) : super(key: key);

  @override
  _FavoritoState createState() => _FavoritoState();
}

class _FavoritoState extends State<Favorito> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 1.w,
      child: IconButton(
        alignment: Alignment.topRight,
        padding: EdgeInsets.all(0),
        onPressed: () {
          setState(() {
            widget.favo = !widget.favo;
          });
          print("change favorito " + widget.favo.toString());
          widget.onChange(widget.favo);
        },
        icon: Icon(
          widget.favo ? Icons.favorite : Icons.favorite_border_outlined,
          color: widget.favo ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
