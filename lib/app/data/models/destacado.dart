import 'dart:convert';

class Destacado {
  final int id;
  final DateTime fecha_inicio;
  final DateTime fecha_fin;
  final bool estado;
  Destacado({
    required this.id,
    required this.fecha_inicio,
    required this.fecha_fin,
    required this.estado,
  });

  Destacado copyWith({
    int? id,
    DateTime? fecha_inicio,
    DateTime? fecha_fin,
    bool? estado,
  }) {
    return Destacado(
      id: id ?? this.id,
      fecha_inicio: fecha_inicio ?? this.fecha_inicio,
      fecha_fin: fecha_fin ?? this.fecha_fin,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha_inicio': fecha_inicio.millisecondsSinceEpoch,
      'fecha_fin': fecha_fin.millisecondsSinceEpoch,
      'estado': estado,
    };
  }

  factory Destacado.fromMap(Map<String, dynamic> map) {
    return Destacado(
      id: map['id'],
      fecha_inicio: DateTime.parse(map['fecha_inicio']),
      fecha_fin: DateTime.parse(map['fecha_fin']),
      estado: map['estado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Destacado.fromJson(String source) =>
      Destacado.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Destacado(id: $id, fecha_inicio: $fecha_inicio, fecha_fin: $fecha_fin, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Destacado &&
        other.id == id &&
        other.fecha_inicio == fecha_inicio &&
        other.fecha_fin == fecha_fin &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fecha_inicio.hashCode ^
        fecha_fin.hashCode ^
        estado.hashCode;
  }
}
