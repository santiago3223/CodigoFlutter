void main() {
  int numero = 4; // si la suma de 4+2 es divisible entre 3
  double sumatoriaDeDigitos = (numero * (numero + 1) / 2);

  print("es divisible por 3 ?  ${sumatoriaDeDigitos % 3 == 0}");
}
