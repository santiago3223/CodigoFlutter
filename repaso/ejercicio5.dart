void main() {
  int nuestroLitrosPiscina = 4000;
  int nuestroLitrosBalde = 5;
  int nuestroLitrosPierdeViaje = 3;

  int vecinolitrosPiscina = 3000;
  int vecinoLitrosBalde = 7;
  int vecinoLitrosPierdeViaje = 2;

  double nuestroCantidadViajes =
      nuestroLitrosPiscina / (nuestroLitrosBalde - nuestroLitrosPierdeViaje);

  double vecinoCantidadViajes =
      vecinolitrosPiscina / (vecinoLitrosBalde - vecinoLitrosPierdeViaje);

  print("Quien llenara primero su piscina?: ");

  if (nuestroCantidadViajes > vecinoCantidadViajes) {
    print("Vecino");
  } else {
    print("Nosotros");
  }
}
