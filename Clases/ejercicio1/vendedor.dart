class Vendedor {
  String nombre;
  List<double> ventas = new List();

  Vendedor(String nombre) {
    this.nombre = nombre;
  }

  void registrarVenta(double montoventa) {
    if (ventas.length < 12) {
      ventas.add(montoventa);
    } else {
      print("Ya ingreso todas las ventas del año");
    }
  }

  double obtenerTotalVentas() {
    //double ventasTot = 0;
    //ventas.forEach((monto) => {ventasTot += monto});
    return ventas.reduce((a, b) => a + b);
  }

  String toString() {
    return "${nombre} : ${obtenerTotalVentas()} ";
  }
}
