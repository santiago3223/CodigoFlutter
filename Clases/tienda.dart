import 'punto.dart';

class Tienda {
  String nombre;
  Punto ubicacion;

  Tienda(String nombre, Punto ubicacion) {
    this.nombre = nombre;
    this.ubicacion = ubicacion;
  }

  String toString() {
    return nombre;
  }
}
