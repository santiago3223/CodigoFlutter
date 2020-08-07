import 'dart:io';
import 'banco.dart';
import 'cuenta.dart';

Banco cajaCodigo;
void main() {
  cajaCodigo = new Banco();
  while (true) {
    print("Bienvenido a nuestro banco");
    print("Digite : ");
    print("1 para ingresar a su cuenta");
    print("2 para crear una nueva cuenta");
    String opcion = stdin.readLineSync();
    if (opcion == "1") {
      print("Ingrese NumeroCuenta");
      String numeroCuenta = stdin.readLineSync();
      Cuenta c = cajaCodigo.buscarCuentaPorNumero(numeroCuenta);
      print(c);
    } else if (opcion == "2") {
      CrearNuevaCuenta();
    }
  }
}

void CrearNuevaCuenta() {
  print("Nueva Cuenta");
  print("Ingrese Nombre");
  String nombre = stdin.readLineSync();
  print("Ingrese NumeroCuenta");
  String numeroCuenta = stdin.readLineSync();
  print("Ingrese Saldo");
  String saldo = stdin.readLineSync();
  Cuenta c = new Cuenta(
      nombreTitular: nombre,
      numeroCuenta: numeroCuenta,
      saldo: double.parse(saldo));
  cajaCodigo.agregarCuenta(c);
  print("Cuenta creada exitosamente :)");
}
