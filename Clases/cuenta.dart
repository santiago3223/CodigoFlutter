class Cuenta {
  int id;
  String nombreTitular;
  String tipo;
  int tipoMoneda;
  double saldo;
  String numeroCuenta;
  List<String> movimientos = new List();

  Cuenta(
      {this.id,
      this.nombreTitular,
      this.tipo,
      this.tipoMoneda,
      this.saldo,
      this.numeroCuenta});

  String toString() {
    return "${nombreTitular} ------ ${saldo}";
  }

  void Depositar(double dinero) {
    saldo += dinero;
    print("Se ha depositado S/. ${dinero}");
    movimientos.add("Se ha depositado S/. ${dinero}");
  }

  void Retirar(double dinero) {
    if (dinero <= saldo) {
      saldo -= dinero;
      print("Se ha retirado S/. ${dinero}");
      movimientos.add("Se ha retirado S/. ${dinero}");
    } else {
      print("No tiene suficientes fondos para retirar S/. ${dinero}");
    }
  }

  void imprimirMovimientos() {
    print("Lista de movimientos");
    print("____________________");
    movimientos.reversed.forEach(print);
  }
}
