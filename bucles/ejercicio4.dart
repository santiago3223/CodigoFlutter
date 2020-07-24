void main() {
  int n = 5;
  int suma = 0;
  int cont = 1;
  while (cont <= n) {
    suma = suma + cont;
    cont = cont + 1;
  }
  print("La sumatoria de 1 a ${n} es ${suma}");
}
