import 'cuenta.dart';

void main() {
  Cuenta solesSantiago = Cuenta(
      nombreTitular: "Santiago",
      tipo: "Corriente",
      tipoMoneda: 1,
      numeroCuenta: "123-123",
      saldo: 100);
  solesSantiago.Depositar(100);
  solesSantiago.Retirar(15);
  solesSantiago.Retirar(5);
  solesSantiago.Depositar(10);
  print("");
  solesSantiago.imprimirMovimientos();
  print(solesSantiago);
}
