import 'trabajadores.dart';

class Profesor extends Trabajador {
  Profesor(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      double sueldoPorHora})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo,
            sueldoPorHora: sueldoPorHora);

  @override
  String toString() {
    // TODO: implement toString
    return "Prof." + super.toString();
  }
}
