import 'dart:math';

void main() {
  var num1 = [
    [1, 1, 1],
    [2, 2, 2]
  ];
  var num2 = [
    [1, 1],
    [2, 2]
  ]; //para usar más adelante en las pruebas

  print(sonIguales(num1, num2));
}

List sumaMatrices(var m1, var m2) {}

bool sonIguales(var l1, var l2) {
  if (l1.length != l2.length) return false;
  for (var i = 0; i < l1.length; i++) {
    if (l1[i].length != l2[i].length) return false;
    for (var j = 0; j < l1[i].length; j++) {
      if (l1[i][j] != l2[i][j]) {
        return false;
      }
    }
  }
  return true;
}

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
