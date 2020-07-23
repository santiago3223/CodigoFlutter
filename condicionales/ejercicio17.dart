void main() {
  String enfermedad = "sida";
  int edad = 17;
  int cantidadDias = 15;
  double costoPorDia;

  if (enfermedad == "neumonia") {
    costoPorDia = 25;
  } else if (enfermedad == "tuberculosis") {
    costoPorDia = 16;
  } else if (enfermedad == "ets") {
    costoPorDia = 20;
  } else if (enfermedad == "sida") {
    costoPorDia = 32;
  }

  if (edad >= 14 && edad <= 22) {
    costoPorDia = costoPorDia * 1.1;
  }

  print(cantidadDias * costoPorDia);
}
