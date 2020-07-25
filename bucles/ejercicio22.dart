import 'dart:math';

void main() {
  int numero = 6;
  int factorSeparacion = 6;
  double factorLargo = 1.7;

  for (int filas = 0; filas < numero * 2; filas++) {
    int numeroDeEspacios =
        (20 + sin(filas / factorLargo) * factorSeparacion).ceil();
    print(" " * numeroDeEspacios + "*");
  }
}
