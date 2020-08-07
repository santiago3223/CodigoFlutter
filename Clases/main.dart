import 'banco.dart';
import 'cuenta.dart';

void main() {
  Cuenta solesSantiago = Cuenta(
      nombreTitular: "Santiago",
      tipo: "Corriente",
      tipoMoneda: 1,
      numeroCuenta: "123-123",
      saldo: 100);
  Cuenta solesWendy = Cuenta(
      nombreTitular: "Wendy",
      tipo: "Corriente",
      tipoMoneda: 1,
      numeroCuenta: "123-124",
      saldo: 100);
  Banco cajaCodigo = new Banco();
  cajaCodigo.agregarCuenta(solesSantiago);
  cajaCodigo.agregarCuenta(solesWendy);
  cajaCodigo.imprimirClientes();
  cajaCodigo.transferencia("123-122", "123-123", 50);
  print(solesWendy);
  print(solesSantiago);
}
