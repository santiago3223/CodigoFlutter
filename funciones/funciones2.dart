void main() {
  int num1 = 10;
  int num2 = 5;
  int num3 = 1;
  print(mayor(mayor(num1, num2), num3));
}

int mayor(int numero1, int numero2) {
  if (numero1 > numero2) {
    return numero1;
  } else {
    return numero2;
  }
}
