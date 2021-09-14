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

User userLogin = User(
  id: 1,
  nombre: "oswaldo",
  apellido: "orellana vasquez",
  numero: "+59162008498",
  email: "oswaldo.orellana.v@gmail.com",
  fechaNacimiento: "02/05/1995",
);

List<User> usuario = [
  User(
    id: 1,
    nombre: "oswaldo",
    apellido: "orellana vasquez",
    numero: "+59162008498",
    email: "oswaldo.orellana.v@gmail.com",
    fechaNacimiento: "02/05/1995",
  ),
  User(
    id: 2,
    nombre: "Franklin",
    apellido: "Borda ",
    numero: "+59178439460",
    email: "franklinborda@gmail.com",
    fechaNacimiento: "02/05/1995",
  ),
  User(
    id: 3,
    nombre: "Genquel",
    apellido: "Orellana vasquez",
    numero: "+59170243529",
    email: "oswaldo.orellana.v@gmail.com",
    fechaNacimiento: "02/05/1995",
  ),
  User(
    id: 4,
    nombre: "no se",
    apellido: "nose quien sera",
    numero: "+59176684968",
    email: "oswaldo.orellana.v@gmail.com",
    fechaNacimiento: "02/05/1995",
  ),
];
