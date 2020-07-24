void main(List<String> args) {
  int dividendo = -18;
  int divisor = 5;
  int respuesta = 0;

  if (dividendo * divisor > 0) {
    // los dos signos son iguales
    dividendo = dividendo.abs();
    divisor = divisor.abs();
    while (dividendo >= divisor) {
      dividendo = dividendo - divisor;
      respuesta++;
    }
  } else {
    // si los dos signos no son iguales, hago lo contrario
    while (dividendo <= -divisor) {
      dividendo = dividendo + divisor;
      respuesta--;
    }
  }
  print("La respuesta es ${respuesta} con residuo ${dividendo}");
}
