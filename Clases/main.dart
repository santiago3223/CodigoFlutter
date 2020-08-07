import 'dart:io';
import 'banco.dart';
import 'cuenta.dart';

Banco cajaCodigo = new Banco();
void main() {
  while (true) {
    print("Bienvenido a nuestro banco");
    print("Digite : ");
    print("1 para ingresar a su cuenta");
    print("2 para crear una nueva cuenta");
    String opcion = stdin.readLineSync();
    if (opcion == "1") {
      ConsultarCuenta();
    } else if (opcion == "2") {
      CrearNuevaCuenta();
    }
  }
}

void ConsultarCuenta() {
  print("Ingrese NumeroCuenta");
  String numeroCuenta = stdin.readLineSync();
  Cuenta c = cajaCodigo.buscarCuentaPorNumero(numeroCuenta);
  if (c != null) {
    print(c);
    print("Digite : ");
    print("1 para depositar");
    print("2 para retirar");
    print("3 para transferir");
    String opcion = stdin.readLineSync();
    if (opcion == "1") {
      print("Ingrese el monto a depositar");
      String saldo = stdin.readLineSync();
      c.Depositar(double.parse(saldo));
    } else if (opcion == "2") {
      print("Ingrese el monto a retirar");
      String saldo = stdin.readLineSync();
      c.Retirar(double.parse(saldo));
    }
    if (opcion == "3") {
      print("Ingrese el monto a transferir");
      String monto = stdin.readLineSync();
      print("Ingrese la cuenta de destino");
      String destino = stdin.readLineSync();
      cajaCodigo.transferencia(c.numeroCuenta, destino, double.parse(monto));
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
