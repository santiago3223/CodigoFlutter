void main() {
  for (int fila = 1; fila < 6; fila++) {
    String aux = "";
    for (int col = 1; col < 6; col++) {
      aux += fila.toString() + "\t";
    }
    print(aux);
  }
}
