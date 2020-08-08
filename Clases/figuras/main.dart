import 'figurageometrica.dart';
import 'rectangulo.dart';
import 'triangulo.dart';

void main(List<String> args) {
  Rectangulo r = new Rectangulo(3, 4);
  Triangulo t = new Triangulo(3, 3, 3);
  imprimirCaracteristicas(t);
  imprimirCaracteristicas(r);
}

double suma(double n1, double n2) => n1 + n2;

void imprimirCaracteristicas(FiguraGeometrica figuraGeometrica) {
  print(figuraGeometrica.obtenerArea());
  print(figuraGeometrica.obtenerPerimetro());
}
