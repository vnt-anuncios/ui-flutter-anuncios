import 'dart:convert';

class Foto {
  final int id;
  final String enlace;
  final int anuncio_id;
  Foto({
    required this.id,
    required this.enlace,
    required this.anuncio_id,
  });

  Foto copyWith({
    int? id,
    String? enlace,
    int? anuncio_id,
  }) {
    return Foto(
      id: id ?? this.id,
      enlace: enlace ?? this.enlace,
      anuncio_id: anuncio_id ?? this.anuncio_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'enlace': enlace,
      'anuncio_id': anuncio_id,
    };
  }

  factory Foto.fromMap(Map<String, dynamic> map) {
    return Foto(
      id: map['id'],
      enlace: map['enlace'],
      anuncio_id: map['anuncio_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Foto.fromJson(String source) => Foto.fromMap(json.decode(source));

  @override
  String toString() =>
      'Foto(id: $id, enlace: $enlace, anuncio_id: $anuncio_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Foto &&
        other.id == id &&
        other.enlace == enlace &&
        other.anuncio_id == anuncio_id;
  }

  @override
  int get hashCode => id.hashCode ^ enlace.hashCode ^ anuncio_id.hashCode;
}
