import 'dart:io';

void main() {
  List<String> alumnos = llenarAlumnos();
}

List llenarAlumnos() {
  List<String> alumnos = [];
  String nombre = stdin.readLineSync();
  while (nombre != "salir") {
    alumnos.add(nombre);
    nombre = stdin.readLineSync();
  }
  print("Se registraron:");
  alumnos.asMap().forEach((i, v) => {print("${i + 1}.- ${v}")});
  return alumnos;
}

void imprimir(var indice, var valor) {
  print("${indice + 1}.- ${valor}");
}

void imprimirListaAlumnos2(List alumnos) {
  alumnos.forEach((alumno) => print(alumno));
}

void imprimirListaAlumnos(List alumnos) {
  for (int i = 0; i < alumnos.length; i++) {
    print("${i + 1}.-${alumnos[i]}");
  }
}
