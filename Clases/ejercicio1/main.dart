/*Se necesita de un programa que sirva para capturar el nombre y 
los valores de las ventas mensuales de un vendedor. Son 12 valores, 
uno por cada mes del año. El programa debe repetirse para tantos vendedores 
como el usuario desea ingresar. Después de ingresar e imprimir los datos de un 
vendedor debe preguntarse al usuario si desea continuar o salir del programa. 
Cuando el usuario seleccione salir debe imprimirse un gran total de las ventas 
registradas en toda la corrida del programa. Se requiere realizar el programa 
utilizando POO. */
import "dart:io";

import 'vendedor.dart';

void main(List<String> args) {
  List<Vendedor> vendedores = [];
  print("Seleccione:");
  print("1 para ingresar usuario");
  print("2 para salir");
  String opcion = stdin.readLineSync();

  while (opcion == "1") {
    print("Ingrese su nombre");
    String nombre = stdin.readLineSync();
    Vendedor nuevoVendedor = new Vendedor(nombre);
    for (int i = 0; i < 12; i++) {
      print("Ingrese el monto de venta para el mes ${i + 1}");
      double monto = double.parse(stdin.readLineSync());
      nuevoVendedor.registrarVenta(monto);
    }
    vendedores.add(nuevoVendedor);
    print("Seleccione:");
    print("1 para ingresar usuario");
    print("2 para salir");
    opcion = stdin.readLineSync();
  }

  vendedores.forEach(print);
}
