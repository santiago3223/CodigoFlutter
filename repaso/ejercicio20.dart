import 'dart:math';

void main() {
  int n = 50;
  int contador = 0;
  for (int i = 1; i <= n; i++) {
    if ((pow(2, i) - 1) % 7 == 0) {
      contador++;
    }
  }

  print(contador);
}
