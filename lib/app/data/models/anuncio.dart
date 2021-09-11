import 'dart:convert';

class Anuncio {
  final int id;
  final String titulo;
  final double precio;
  final DateTime fecha_publicacion;
  final String condicion;
  final String ubicacion;
  final String enlace;
  final String descripcion;

  Anuncio({
    required this.id,
    required this.titulo,
    required this.precio,
    required this.fecha_publicacion,
    required this.condicion,
    required this.ubicacion,
    required this.enlace,
    required this.descripcion,
  });

  Anuncio copyWith({
    int? id,
    String? titulo,
    double? precio,
    DateTime? fecha_publicacion,
    String? condicion,
    String? ubicacion,
    String? enlace,
    String? descripcion,
  }) {
    return Anuncio(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      precio: precio ?? this.precio,
      fecha_publicacion: fecha_publicacion ?? this.fecha_publicacion,
      condicion: condicion ?? this.condicion,
      ubicacion: ubicacion ?? this.ubicacion,
      enlace: enlace ?? this.enlace,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'precio': precio,
      'fecha_publicacion': fecha_publicacion.millisecondsSinceEpoch,
      'condicion': condicion,
      'ubicacion': ubicacion,
      'enlace': enlace,
      'descripcion': descripcion,
    };
  }

  factory Anuncio.fromMap(Map<String, dynamic> map) {
    return Anuncio(
      id: map['id'],
      titulo: map['titulo'],
      precio: map['precio'].toDouble(),
      fecha_publicacion: DateTime.parse(map['fecha_publicacion']),
      condicion: map['condicion_encuentra'],
      ubicacion: map['ubicacion'],
      enlace: map['enlace'],
      descripcion: map['descripcion'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Anuncio.fromJson(String source) =>
      Anuncio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Anuncio(id: $id, titulo: $titulo, precio: $precio, fecha_publicacion: $fecha_publicacion, condicion: $condicion, ubicacion: $ubicacion, enlace: $enlace, descripcion: $descripcion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Anuncio &&
        other.id == id &&
        other.titulo == titulo &&
        other.precio == precio &&
        other.fecha_publicacion == fecha_publicacion &&
        other.condicion == condicion &&
        other.ubicacion == ubicacion &&
        other.enlace == enlace &&
        other.descripcion == descripcion;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        precio.hashCode ^
        fecha_publicacion.hashCode ^
        condicion.hashCode ^
        ubicacion.hashCode ^
        enlace.hashCode ^
        descripcion.hashCode;
  }
}
