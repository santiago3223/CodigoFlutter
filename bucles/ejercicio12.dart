import 'dart:math';

void main(List<String> args) {
  int numero = 31;
  for (int i = 2; i < sqrt(numero); i++) {
    print(i);
    if (numero % i == 0) {
      print("no es primo");
      return;
    }
  }
  print("si es primo");
}
