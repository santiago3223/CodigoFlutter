void main() {
  int numeroFosforos = 15;
  int numeroRetirar = 13;

  if (numeroFosforos >= 3 * numeroRetirar) {
    print("Saca cualquiera");
  } else if (numeroFosforos - numeroRetirar < numeroRetirar) {
    print(numeroRetirar);
  } else if (numeroFosforos >= numeroRetirar + 3) {
    int numeroVictoria = numeroRetirar + 2;
    print(numeroFosforos - numeroVictoria);
  } else if (numeroFosforos == 1) {
    print("Perdi");
  } else {
    print(1);
  }
}
