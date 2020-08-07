import 'dart:math';

import 'punto.dart';
import 'tienda.dart';

void main() {
  Punto miCasa = new Punto(0, 0);
  List<Tienda> tiendas = new List();
  tiendas.add(new Tienda("Mi Tiendita", new Punto(5, 6)));
  tiendas.add(new Tienda("Tu Tiendita", new Punto(-2, 3)));
  tiendas.add(new Tienda("Nuestra Tiendita", new Punto(1, 1)));
  tiendas.add(new Tienda("Libreria 2x2", new Punto(-1, -4)));
  print(tiendas);
  print(tiendas[0].ubicacion.distancia(tiendas[1].ubicacion));
}
