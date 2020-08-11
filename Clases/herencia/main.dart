import 'administrativo.dart';
import 'alumno.dart';
import 'asignatura.dart';
import 'profesor.dart';

main(List<String> args) {
  Alumno a1 = new Alumno(nombres: "Santiago 1");
  Alumno a2 = new Alumno(nombres: "Santiago 2");
  Alumno a3 = new Alumno(nombres: "Santiago 3");
  Administrativo adm = new Administrativo(nombres: "administradorin");
  Profesor p = new Profesor(
      nombres: "Santiago2",
      apellidos: "Lovón",
      codigo: 2,
      correo: "slg@gmail.com");

  Asignatura asignatura = new Asignatura(nombre: "CodiGo", profesor: adm);
  asignatura += a1;
  asignatura += a2;

  print(asignatura.alumnos);
  print(asignatura[0]);
}
