import 'dart:math';

import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:flutter/material.dart';

class MyImageNetWork extends StatelessWidget {
  final List<Foto> fotos;
  const MyImageNetWork({Key? key, required this.fotos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!fotos.isEmpty)
        ? FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: "assets/img/loading.gif",
            image: fotos
                .elementAt(
                  Random().nextInt(fotos.length),
                )
                .enlace,
          )
        : Image.asset(
            "assets/img/image_not_found.png",
            fit: BoxFit.fill,
          );
  }
}
