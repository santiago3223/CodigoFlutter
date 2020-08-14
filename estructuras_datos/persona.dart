class Persona {
  int id;
  String nombre;

  Persona({this.id, this.nombre});

  bool operator >(Persona p) => id > p.id;

  @override
  bool operator ==(Persona p) => id == p.id;

  @override
  String toString() {
    // TODO: implement toString
    return nombre + id.toString();
  }
}
