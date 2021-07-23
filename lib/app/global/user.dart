class User {
  final double id;
  final String nombre;
  final String apellido;
  final String numero;
  final String email;
  final String fechaNacimiento;
  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.numero,
    required this.email,
    required this.fechaNacimiento,
  });
}

User user = User(
  id: 1,
  nombre: "oswaldo",
  apellido: "orellana vasquez",
  numero: "+59162008498",
  email: "oswaldo.orellana.v@gmail.com",
  fechaNacimiento: "02/05/1995",
);
