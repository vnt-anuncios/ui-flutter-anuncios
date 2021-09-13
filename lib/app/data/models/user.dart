import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String? apellido;
  final String? telefono;
  final String? ubicacion;
  final String foto;
  final bool estado;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.apellido,
    this.telefono,
    this.ubicacion,
    required this.foto,
    required this.estado,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? apellido,
    String? telefono,
    String? ubicacion,
    String? foto,
    bool? estado,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      apellido: apellido ?? this.apellido,
      telefono: telefono ?? this.telefono,
      ubicacion: ubicacion ?? this.ubicacion,
      foto: foto ?? this.foto,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'apellido': apellido,
      'telefono': telefono,
      'ubicacion': ubicacion,
      'foto': foto,
      'estado': estado,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      apellido: map['apellido'],
      telefono: map['telefono'],
      ubicacion: map['ubicacion'],
      foto: map['foto'],
      estado: map['estado'] == 0 ?false:true,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, apellido: $apellido, telefono: $telefono, ubicacion: $ubicacion, foto: $foto, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.apellido == apellido &&
        other.telefono == telefono &&
        other.ubicacion == ubicacion &&
        other.foto == foto &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        apellido.hashCode ^
        telefono.hashCode ^
        ubicacion.hashCode ^
        foto.hashCode ^
        estado.hashCode;
  }
}
