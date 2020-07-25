void main() {
  int numero = 6;
  String espaciosBlanco = "  " * (numero - 1);
  print(espaciosBlanco + "*");

  for (int filas = 1; filas < numero - 1; filas++) {
    print("*");
  }

  print("* " * (2 * numero - 1));
}
