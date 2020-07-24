import 'dart:math';

void main(List<String> args) {
  for (int numero = 2; numero < 1000; numero++) {
    bool temporalEsPrimo = true;
    for (int i = 2; i < sqrt(numero); i++) {
      if (numero % i == 0) {
        temporalEsPrimo = false;
      }
    }
    if (temporalEsPrimo) {
      print("${numero} Si es primo");
    }
  }
}
