import 'dart:convert';

class Categoria {
  final int id;
  final String nombre;
  final String imagen;
  final int? categoria_id;
  Categoria({
    required this.id,
    required this.nombre,
    required this.imagen,
    this.categoria_id,
  });

  Categoria copyWith({
    int? id,
    String? nombre,
    String? imagen,
    int? categoria_id,
  }) {
    return Categoria(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      imagen: imagen ?? this.imagen,
      categoria_id: categoria_id ?? this.categoria_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'imagen': imagen,
      'categoria_id': categoria_id,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      nombre: map['nombre'],
      imagen: map['imagen'],
      categoria_id: map['categoria_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) =>
      Categoria.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categoria(id: $id, nombre: $nombre, imagen: $imagen, categoria_id: $categoria_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Categoria &&
        other.id == id &&
        other.nombre == nombre &&
        other.imagen == imagen &&
        other.categoria_id == categoria_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nombre.hashCode ^
        imagen.hashCode ^
        categoria_id.hashCode;
  }
}
