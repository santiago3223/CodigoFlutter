void main() {
  int numero = 7;
  String espaciosBlanco = "  " * (numero - 1);
  print(espaciosBlanco + "*");

  for (int filas = 1; filas < numero - 1; filas++) {
    print("  " * (numero - filas - 1) +
        "* " +
        "  " * (filas * 2 - 1) +
        "*"); // imprimimos espacios y asterisco
  }

  print("* " * (2 * numero - 1));
}
