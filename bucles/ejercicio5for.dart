void main(List<String> args) {
  int n = 10;
  int factorial = 1;

  for (int i = 1; i <= n; i++) {
    factorial *= i; // factorial = factorial *i
  }

  print(factorial);
}
