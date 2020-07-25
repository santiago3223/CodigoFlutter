void main() {
  for (int fila = 1; fila < 6; fila++) {
    String aux = "";
    for (int col = fila; col < 2 * fila; col++) {
      aux += col.toString() + "\t";
    }
    print(aux);
  }
}
