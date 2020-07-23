void main(List<String> args) {
  int tiempoEnSegundos = 12015;
  int horaEnSegundos = 3600;
  int minutoEnSegundos = 60;

  int cantHoras = (tiempoEnSegundos / horaEnSegundos).floor();
  print(cantHoras);

  tiempoEnSegundos = tiempoEnSegundos - cantHoras * horaEnSegundos;

  int cantMinutos = (tiempoEnSegundos / minutoEnSegundos).floor();
  print(cantMinutos);

  tiempoEnSegundos = tiempoEnSegundos - cantMinutos * minutoEnSegundos;

  int cantSegundos = tiempoEnSegundos;
  print(cantSegundos);
}
