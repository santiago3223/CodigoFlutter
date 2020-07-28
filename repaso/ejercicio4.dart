void main() {
  int numero1 = 6;
  int numero2 = 8;

  double factorial = 1;
  for (int i = 1; i <= numero1; i++) {
    factorial = factorial * i;
  }

  print(
      "${numero1}! es divisible entre ${numero2}? : ${factorial % numero2 == 0} ");
}
