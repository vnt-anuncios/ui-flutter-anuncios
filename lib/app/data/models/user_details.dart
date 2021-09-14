import 'dart:convert';

class UserDetail {
  final int id;
  final String name;
  final String foto;
  final String? apellido;
  final String telefono;
  final String ubicacion;
  UserDetail({
    required this.id,
    required this.name,
    required this.foto,
    required this.apellido,
    required this.telefono,
    required this.ubicacion,
  });

  UserDetail copyWith({
    int? id,
    String? name,
    String? foto,
    String? apellido,
    String? telefono,
    String? ubicacion,
  }) {
    return UserDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      foto: foto ?? this.foto,
      apellido: apellido ?? this.apellido,
      telefono: telefono ?? this.telefono,
      ubicacion: ubicacion ?? this.ubicacion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'foto': foto,
      'apellido': apellido,
      'telefono': telefono,
      'ubicacion': ubicacion,
    };
  }

  factory UserDetail.fromMap(Map<String, dynamic> map) {
    return UserDetail(
      id: map['id'],
      name: map['name'],
      foto: map['foto'],
      apellido: map['apellido'],
      telefono: map['telefono'],
      ubicacion: map['ubicacion'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetail.fromJson(String source) =>
      UserDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDetail(id: $id, name: $name, foto: $foto, apellido: $apellido, telefono: $telefono, ubicacion: $ubicacion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetail &&
        other.id == id &&
        other.name == name &&
        other.foto == foto &&
        other.apellido == apellido &&
        other.telefono == telefono &&
        other.ubicacion == ubicacion;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        foto.hashCode ^
        apellido.hashCode ^
        telefono.hashCode ^
        ubicacion.hashCode;
  }
}
