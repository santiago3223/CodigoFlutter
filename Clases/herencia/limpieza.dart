import 'trabajadores.dart';

class Limpieza extends Trabajador {
  @override
  double obtenerSueldoTotal(int horas) {
    return sueldoPorHora * horas * 0.8;
  }
}
