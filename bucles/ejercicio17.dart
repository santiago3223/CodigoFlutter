void main() {
  for (int fila = 1; fila < 6; fila++) {
    String aux = "";
    for (int col = 1; col <= fila; col++) {
      aux += col.toString() + "\t";
    }
    print(aux);
  }
}
