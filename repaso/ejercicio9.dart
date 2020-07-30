import 'dart:math';

void main() {
  int canalA = 90;
  int canalB = 15;
  print("Cuantas veces debo de cambiar de canal?");
  int diferencia = (canalB - canalA).abs();
  if (diferencia >= 49) {
    print("da la vuelta");
    print(99 - diferencia);
  } else {
    print(diferencia);
  }
}
