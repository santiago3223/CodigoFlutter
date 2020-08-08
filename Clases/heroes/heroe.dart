class Heroe {
  // el nombre de la clase
  // atributos o miembrosdato
  String nombre;
  List<String> poder;

  // Constructor
  Heroe(String nombre, List<String> poder) {
    this.nombre = nombre;
    this.poder = poder;
  }
  //MEtodo toString para que pueda imprimirse
  String toString() => "${nombre} - ${poder}";
}
