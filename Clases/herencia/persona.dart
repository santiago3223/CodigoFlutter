abstract class Persona {
  int codigo;
  String nombres;
  String apellidos;
  String correo;

  Persona({this.codigo, this.nombres, this.apellidos, this.correo});

  String toString() {
    return "$codigo $nombres $apellidos $correo";
  }
}
