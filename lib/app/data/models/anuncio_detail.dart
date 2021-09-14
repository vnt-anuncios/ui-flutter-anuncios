import 'dart:collection';
import 'package:anuncios_ui/app/data/models/destacado.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';

import 'anuncio.dart';

class AnuncioDetails {
  final Anuncio anuncio;
  final List<Foto> fotos;
  final User user;
  final bool isFavorito;
  final Categoria categoria;
  final Destacado? destacados;

  AnuncioDetails(this.anuncio, this.fotos, this.user, this.isFavorito,
      this.categoria, this.destacados);
}
