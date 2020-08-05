void main() {
  List alumnos = []; //lista de filas
  for (int i = 0; i < 5; i++) {
    alumnos.add([]);
    for (int e = 0; e < 4; e++) {
      alumnos[i].add("Alumno ${i}${e}");
    }
  }

  imprimirLista2(alumnos);
}

void imprimirLista(List l) {
  l.forEach((fila) => {print(fila.join("\t"))});
}

void imprimirLista2(List l) {
  String filaimpresa;
  l.forEach((fila) => {
        filaimpresa = "",
        fila.forEach((alumno) => {filaimpresa += "${alumno} \t"}),
        print(filaimpresa)
      });
}
