void main() {
  var ejemplo = [
    [3, 2, 4],
    [0, 1, 5],
    [0, 0, 2]
  ];
  imprimirLista(ejemplo);
  print(esTriangularSuperior(ejemplo));
}

bool esTriangularSuperior(List<List<int>> l) {
  for (int i = 0; i < l.length; i++) {
    for (int j = 0; j < i; j++) {
      if (l[i][j] != 0) return false;
    }
  }
  return true;
}

void imprimirLista(List l) {
  l.forEach((fila) => {print(fila.join("\t"))});
}
