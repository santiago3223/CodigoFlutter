void main(List<String> args) {
  int dividendo = 25;
  int divisor = 5;

  int respuesta = 0;
  while (dividendo >= divisor) {
    dividendo = dividendo - divisor;
    respuesta++;
  }

  print("La respuesta es ${respuesta} con residuo ${dividendo}");
}
