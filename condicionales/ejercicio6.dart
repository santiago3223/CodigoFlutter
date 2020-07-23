import 'dart:math';

void main() {
  double a = 10;
  double b = 2;
  double c = 5;
  double determinante = b * b - 4 * a * c;

  if (determinante > 0) {
    double resp1 = -(b + sqrt(determinante)) / (2 * a);
    double resp2 = -(b - sqrt(determinante)) / (2 * a);
    print(resp1);
    print(resp2);
  } else {
    print("No hay respuesta");
  }
}
