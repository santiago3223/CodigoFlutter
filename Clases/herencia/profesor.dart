import 'persona.dart';

class Profesor extends Persona {
  double sueldo;

  Profesor(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.sueldo})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);
}
