import 'persona.dart';

class Alumno extends Persona {
  double pension;

  Alumno(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.pension})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);
}
