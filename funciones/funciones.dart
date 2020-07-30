void main() {
  DescomponeEntero(456);
}

void DescomponeEntero2(int numero) {}

void DescomponeEntero(int numero) {
  String nums = numero.toString();
  for (int i = 0; i < nums.length; i++) {
    print(nums[nums.length - i - 1]);
  }
}

void MuestraNoMultiplos(int limite, int multiplo) {
  String respuesta = "";
  for (int i = 1; i < limite; i++) {
    if (i % multiplo != 0) {
      respuesta = respuesta + i.toString() + " ";
    }
  }
  print(respuesta);
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
