import 'fecha.dart';

void main(List<String> args) {
  Fecha hoy = new Fecha(07, 08, 2020);
  print(hoy);

  Fecha inventada = new Fecha(28, 08, 2020);
  print(inventada);
  print(inventada - hoy);

  List<double> listanumeros = [1, 2, 3, 4, 5, 6];
  listanumeros.forEach(print);
}
