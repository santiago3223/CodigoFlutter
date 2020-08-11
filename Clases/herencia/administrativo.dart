import 'trabajadores.dart';

class Administrativo extends Trabajador {
  String cargo;

  Administrativo(
      {int codigo,
      String nombres,
      String apellidos,
      String correo,
      this.cargo,
      double sueldoPorHora})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo,
            sueldoPorHora: sueldoPorHora);

  String toString() {
    return "Adm." + super.toString();
  }

  double obtenerSueldoTotal(int horas) {
    if (horas > 40) {
      horas += horas - 40;
    }
    return horas * sueldoPorHora;
  }
}
