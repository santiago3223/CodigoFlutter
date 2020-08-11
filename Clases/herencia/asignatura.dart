import 'alumno.dart';
import 'persona.dart';
import 'profesor.dart';

class Asignatura {
  String nombre;
  Persona profesor;
  List<Alumno> alumnos = [];

  Asignatura({this.nombre, this.profesor, this.alumnos});

  @override
  String toString() {
    return nombre + ": " + profesor.toString();
  }

  void agregarAlumno(Alumno a) {
    if (alumnos == null) alumnos = [];
    alumnos.add(a);
  }

  Asignatura operator +(Alumno a) {
    if (this.alumnos == null) this.alumnos = [];
    this.alumnos.add(a);
    return this;
  }

  Alumno operator [](int i) {
    return alumnos[i];
  }
}
