import 'persona.dart';

class Trabajador extends Persona {
  double sueldoPorHora;

  Trabajador(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.sueldoPorHora})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);

  double obtenerSueldoTotal(int horas) {
    return horas * sueldoPorHora;
  }
}
