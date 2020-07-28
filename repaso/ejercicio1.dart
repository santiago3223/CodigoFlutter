main() {
  double lunes = 0;
  double martes = 15;
  double miercoles = 25;
  double jueves = 100;
  double viernes = 10;
  double sabado = 200;
  double domingo = 35;

  String diamasventas = "Domingo";
  String diamenosventas = "Martes";
  double maximo = domingo;
  double minimo = martes;

  // Calcular dia con mas ventas

  if (martes > maximo) {
    maximo = martes;
    diamasventas = "martes";
  }

  if (miercoles > maximo) {
    maximo = miercoles;
    diamasventas = "miercoles";
  }

  if (jueves > maximo) {
    maximo = jueves;
    diamasventas = "jueves";
  }

  if (viernes > maximo) {
    maximo = viernes;
    diamasventas = "viernes";
  }

  if (sabado > maximo) {
    maximo = sabado;
    diamasventas = "sabado";
  }

  // Calcular dia con menos ventas

  if (miercoles < minimo) {
    minimo = miercoles;
    diamenosventas = "miercoles";
  }

  if (jueves < minimo) {
    minimo = jueves;
    diamenosventas = "jueves";
  }

  if (viernes < minimo) {
    minimo = viernes;
    diamenosventas = "viernes";
  }

  if (sabado < minimo) {
    minimo = sabado;
    diamenosventas = "sabado";
  }

  if (domingo < minimo) {
    minimo = domingo;
    diamenosventas = "domingo";
  }

  //Programar

  double media = (martes + miercoles + jueves + viernes + sabado + domingo) / 6;
  print("El dia que menos vende es: ${diamenosventas}");
  print("El dia que mas vende es: ${diamasventas}");
  if (media > domingo) {
    print("La media de la semana supera a las ventas del domingo? SI");
  } else {
    print("La media de la semana supera a las ventas del domingo? NO");
  }
}
