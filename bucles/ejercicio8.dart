void main(List<String> args) {
  int dividendo = 50;
  int divisor = -95;
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
    if (dividendo > 0) {
      dividendo = -dividendo;
      divisor = -divisor;
    }
    while (dividendo <= -divisor) {
      dividendo = dividendo + divisor;
      respuesta--;
    }
  }
  print("La respuesta es ${respuesta} con residuo ${dividendo}");
}
