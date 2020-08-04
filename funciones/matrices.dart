import 'dart:math';

void main() {
  List<List<int>> num1 = [];
  var num2 = []; //para usar más adelante en las pruebas
  var rng = new Random();
  for (int fil = 0; fil < 5; fil++) {
    num1.add([]);
    for (int col = 0; col < 4; col++) {
      num1[fil].add(rng.nextInt(100));
    }
  }
  print(esNula(num1));
}

bool sonIguales(List l1, List l2) {}

bool esNula(List lista) {
  for (var i = 0; i < lista.length; i++) {
    for (var j = 0; j < lista[i].length; j++) {
      if (lista[i][j] != 0) {
        return false;
      }
    }
  }
  return true;
}

void imprimirMatriz(List lista) {
  for (var i = 0; i < lista.length; i++) {
    String item = '';
    for (var j = 0; j < lista[i].length; j++) {
      String itemAString = lista[i][j].toString();
      item += itemAString + '\t';
    }
    print(item);
  }
}
