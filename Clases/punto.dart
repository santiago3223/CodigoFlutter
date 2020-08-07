import 'dart:math';

class Punto {
  double x;
  double y;

  Punto(double x, double y) {
    this.x = x;
    this.y = y;
  }

  double operator -(Punto p) {
    return pow(pow(this.x - p.x, 2) + pow(this.y - p.y, 2), 0.5);
  }

  double distancia(Punto p) {
    return pow(pow(this.x - p.x, 2) + pow(this.y - p.y, 2), 0.5);
  }
}
