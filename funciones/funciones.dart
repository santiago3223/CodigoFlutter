int numero = 15;
void main() {
  ImprimirRectangulo(8);
  ImprimirRectangulo(9);
  ImprimirRectangulo(9, 5);
}

void ImprimirRectangulo(int filas, [int columnas = 12]) {
  for (int i = 0; i < filas; i++) {
    print("* " * columnas);
  }
}

void ImprimirTablaDeMultiplicar(int numero) {
  for (int i = 0; i <= 12; i++) {
    print("${numero} x ${i} = ${numero * i}");
  }
}

void ImprimirError(int numero, String causa) {
  print("Error: ");
  print("Numero: ${numero} ");
  print("Causa: ${causa}");
}

int ObtenerMayor(int numero1, int numero2) {
  if (numero1 > numero2) {
    return numero1;
  } else {
    return numero2;
  }
}
