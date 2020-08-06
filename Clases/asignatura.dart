import 'alumno.dart';

class Asignatura {
  int codigo;
  String nombre;
  String horario;
  String seccion;
  int duracionEnHoras;
  List<Alumno> alumnos = new List();

  Asignatura(
      {this.codigo,
      this.nombre,
      this.horario,
      this.seccion,
      this.duracionEnHoras});

  String toString() {
    return "${codigo} - ${nombre}";
  }

  void imprimirAlumnos() {
    alumnos.forEach(print);
  }

  void matricularAlumno(Alumno a) {
    alumnos.add(a);
  }

  void retirarAlumno(Alumno a) {
    alumnos.remove(a);
  }

  int obtenerCantidadDesaprobados() {
    return alumnos.where((alumno) => alumno.notaFinal < 11).toList().length;
  }

  Alumno obtenerPrimerPuesto() {
    Alumno primerPuesto = alumnos[0];
    for (int i = 0; i < alumnos.length; i++) {
      if (alumnos[i].notaFinal > primerPuesto.notaFinal)
        primerPuesto = alumnos[i];
    }
    return primerPuesto;

/*
    Alumno primerPuesto = alumnos[0];
    alumnos.forEach((alumno) =>
        {if (alumno.notaFinal > primerPuesto.notaFinal) primerPuesto = alumno});
    return primerPuesto;
    alumnos.sort((a1, a2) => a2.notaFinal.compareTo(a1.notaFinal));
    return alumnos[0];
    */
  }
}
