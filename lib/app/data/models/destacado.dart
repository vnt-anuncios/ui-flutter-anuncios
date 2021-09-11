import 'dart:convert';

class Destacado {
  final int id;
  final DateTime fecha_inicio;
  final DateTime fecha_fin;
  Destacado({
    required this.id,
    required this.fecha_inicio,
    required this.fecha_fin,
  });

  Destacado copyWith({
    int? id,
    DateTime? fecha_inicio,
    DateTime? fecha_fin,
  }) {
    return Destacado(
      id: id ?? this.id,
      fecha_inicio: fecha_inicio ?? this.fecha_inicio,
      fecha_fin: fecha_fin ?? this.fecha_fin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha_inicio': fecha_inicio.millisecondsSinceEpoch,
      'fecha_fin': fecha_fin.millisecondsSinceEpoch,
    };
  }

  factory Destacado.fromMap(Map<String, dynamic> map) {
    return Destacado(
      id: map['id'],
      fecha_inicio: DateTime.parse(map['fecha_inicio']),
      fecha_fin: DateTime.parse(map['fecha_fin']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Destacado.fromJson(String source) =>
      Destacado.fromMap(json.decode(source));

  @override
  String toString() =>
      'Destacado(id: $id, fecha_inicio: $fecha_inicio, fecha_fin: $fecha_fin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Destacado &&
        other.id == id &&
        other.fecha_inicio == fecha_inicio &&
        other.fecha_fin == fecha_fin;
  }

  @override
  int get hashCode => id.hashCode ^ fecha_inicio.hashCode ^ fecha_fin.hashCode;
}
