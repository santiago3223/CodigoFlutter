import 'persona.dart';

class Administrativo extends Persona {
  String cargo;

  Administrativo(
      {int codigo, String nombres, String apellidos, String correo, this.cargo})
      : super(
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            correo: correo);
  @override
  String toString() {
    // TODO: implement toString
    return "Adm." + super.toString();
  }
}
