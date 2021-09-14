import 'package:anuncios_ui/app/data/models/destacado.dart';
import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/data/models/foto.dart';
import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/models/user_details.dart';

import 'anuncio.dart';

class AnuncioDetails {
  final Anuncio anuncio;
  final List<Foto> fotos;
  final User user;
  bool isFavorito;
  final Categoria categoria;
  final Destacado? destacados;

  AnuncioDetails(this.anuncio, this.fotos, this.user, this.isFavorito,
      this.categoria, this.destacados);
}

class AnuncioDetails2 {
  final Anuncio anuncio;
  final List<Foto> fotos;
  final UserDetail user;
  final bool isFavorito;
  final Categoria categoria;
  final Destacado? destacados;

  AnuncioDetails2(this.anuncio, this.fotos, this.user, this.isFavorito,
      this.categoria, this.destacados);
}
