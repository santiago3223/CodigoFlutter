void main() {
  double numero1 = 15;
  double numero2 = 10;
  String operacion = "division"; //suma, resta, multiplicacion, division

  switch (operacion) {
    case "suma":
      print(numero1 + numero2);
      break;
    case "resta":
      print(numero1 - numero2);
      break;
    case "multiplicacion":
      print(numero1 * numero2);
      break;
    case "division":
      print(numero1 / numero2);
      break;
    default:
      print("Operación incorrecta");
      break;
  }
}
