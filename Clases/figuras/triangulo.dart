import 'dart:math';

import 'figurageometrica.dart';

class Triangulo extends FiguraGeometrica {
  double lado1;
  double lado2;
  double lado3;

  Triangulo(double l1, double l2, double l3) {
    lado1 = l1;
    lado2 = l2;
    lado3 = l3;
  }

  double obtenerPerimetro() {
    return lado1 + lado2 + lado3;
  }

  double obtenerArea() {
    double s = (lado1 + lado2 + lado3) / 2;
    return pow(s * (s - lado1) * (s - lado2) * (s - lado3), 0.5);
  }
}
