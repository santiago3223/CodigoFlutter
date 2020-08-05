void main() {
  List alumnos = []; //lista de filas

  for (int i = 0; i < 5; i++) {
    alumnos.add([]);
    for (int e = 0; e < 4; e++) {
      alumnos[i].add("Alumno ${i}${e}");
    }
  }

  imprimirLista(alumnos);
}

void imprimirLista(List l) {
  l.forEach((fila) => {print(fila.join("\t"))});
}
