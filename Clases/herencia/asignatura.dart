import 'alumno.dart';
import 'profesor.dart';

class Asignatura {
  String nombre;
  Profesor profesor;
  List<Alumno> alumnos = [];

  Asignatura({this.nombre, this.profesor, this.alumnos});
}
