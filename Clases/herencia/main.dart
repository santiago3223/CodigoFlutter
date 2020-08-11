import 'asignatura.dart';
import 'administrativo.dart';
import 'persona.dart';
import 'profesor.dart';
import 'trabajadores.dart';
import 'voluntario.dart';

main(List<String> args) {
  Administrativo adm =
      new Administrativo(nombres: "administradorin", sueldoPorHora: 10);
  Profesor p = new Profesor(
      nombres: "Santiago2",
      apellidos: "Lovón",
      codigo: 2,
      correo: "slg@gmail.com",
      sueldoPorHora: 10);
  List<Trabajador> trabajadores = [];
  trabajadores.add(p);
  trabajadores.add(adm);

  Voluntario voluntario = new Voluntario();
  Asignatura a = new Asignatura(profesor: voluntario);

  trabajadores.forEach((f) => {print(f.obtenerSueldoTotal(50))});
}
