void main() {
  int horas = 23;
  int minutos = 55;

  int minutosdia = 24 * 60;
  int minutoshoras = horas * 60;

  int resultado = minutosdia - minutoshoras - minutos;

  print("Faltan ${resultado} minutos");
}
