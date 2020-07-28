void main() {
  int cantidadGotas = 259;
  print(cantidadGotas / 3600);
  print((cantidadGotas / 3600).floor());

  int cantidadHoras = (cantidadGotas / 3600).floor();
  cantidadGotas -= cantidadHoras * 3600;

  int cantidadMinutos = (cantidadGotas / 60).floor();
  cantidadGotas -= cantidadMinutos * 60;

  print(
      "tiempo maximo sin cambiar cubo = ${cantidadHoras}:${cantidadMinutos}:${cantidadGotas}");
}
