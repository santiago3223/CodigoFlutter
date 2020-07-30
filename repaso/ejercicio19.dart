void main() {
  int ancho = 5;
  int largo = 5;
  int total = ancho * largo;

  if (total % 2 == 0) {
    print("Claras: ${total / 2}");
    print("Oscuras: ${total / 2}");
  } else {
    print("Claras: ${(total + 1) / 2}");
    print("Oscuras: ${(total + 1) / 2 - 1}");
  }
}
