import 'figurageometrica.dart';

class Rectangulo extends FiguraGeometrica {
  double base;
  double altura;

  Rectangulo(double base, double altura) {
    this.altura = altura;
    this.base = base;
  }

  double obtenerArea() {
    return base * altura;
  }

  double obtenerPerimetro() {
    return base * 2 + altura * 2;
  }
}
