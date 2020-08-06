import 'alumno.dart';
import 'asignatura.dart';

void main() {
  Asignatura flutter = new Asignatura(codigo: 1, nombre: "Codigo Flutter");

  Alumno alm1 = new Alumno(
      codigo: 1, nombres: "Santiago", apellidos: "Lovon", notaFinal: 20);
  Alumno alm2 = new Alumno(codigo: 2, nombres: "Clark", notaFinal: 05);
  Alumno alm3 = new Alumno(
      codigo: 3, nombres: "Wendy", genero: "Femenino", notaFinal: 20);
  flutter.matricularAlumno(alm1);
  flutter.matricularAlumno(alm2);
  flutter.matricularAlumno(alm3);

  flutter.imprimirAlumnos();
  print(flutter.obtenerCantidadDesaprobados());
  print("Primer puestp");
  print(flutter.obtenerPrimerPuesto());
  flutter.imprimirAlumnos();
}
