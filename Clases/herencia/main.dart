import 'administrativo.dart';
import 'persona.dart';
import 'profesor.dart';
import 'trabajadores.dart';

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

  trabajadores.forEach((f) => {print(f.obtenerSueldoTotal(50))});
}
