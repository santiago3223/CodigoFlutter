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
}
