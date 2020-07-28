void main() {
  int numero = 10000;

  double factorial = 1;
  if (numero >= 5) {
    print("El digito de mas a la derecha del factorial es: 0");
    return;
  }

  for (int i = 1; i <= numero; i++) {
    factorial = factorial * i;
  }

  print("El digito de mas a la derecha del factorial es: ${factorial % 10}");
}
