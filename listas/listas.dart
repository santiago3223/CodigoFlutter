import 'dart:math';

void main() {
  List<int> numero = [22, 25, 29, 30, 31, 35, 45];
  Random r = Random();
  for (int i = 0; i < 100000; i++) {
    numero.add(r.nextInt(100000));
  }
  numero.sort();
  //busquedaBinariaIterativa(numero, 5000);
  numero.contains(5000);
}

bool busquedaBinariaIterativa(List numeros, int n) {
  int inicio = 0;
  int fin = numeros.length;
  int posmedio = ((fin + inicio) / 2).floor();
  int medio = numeros[posmedio];
  while (true) {
    print("Inicio : ${inicio}  Fin : ${fin} ");
    if (medio == n) return true;
    if (fin - inicio <= 1) return false;
    if (n < medio) {
      fin = posmedio - 1;
    } else {
      inicio = posmedio + 1;
    }
    posmedio = ((fin + inicio) / 2).floor();
    medio = numeros[posmedio];
  }
}

bool busquedaBinaria(List numeros, int n) {
  print("entra");
  int posmedio = (numeros.length / 2).floor();
  int medio = numeros[posmedio];
  if (medio == n) {
    return true;
  }
  if (numeros.length == 1) {
    return false;
  }
  if (n > medio) {
    return busquedaBinaria(numeros.sublist(posmedio), n);
  } else {
    return busquedaBinaria(numeros.sublist(0, posmedio), n);
  }
}

bool buscarEnLista(List numeros, int n) {
  for (int i = 0; i < numeros.length; i++) {
    if (numeros[i] == n) {
      return true;
    }
  }
  return false;
}

bool estaOrdenadoDescendente(List numeros) {
  for (int i = 0; i < numeros.length - 1; i++) {
    if (numeros[i] < numeros[i + 1]) {
      return false;
    }
  }
  return true;
}

int maximoElementosRecursivo(List numeros) {
  if (numeros.length == 2) {
    print("Comparamos ${numeros[0]} y  ${numeros[1]}");
    return numeros[0] > numeros[1] ? numeros[0] : numeros[1];
  }
  int num1 = numeros[0];
  int num2 = maximoElementosRecursivo(numeros.sublist(1, numeros.length));
  print("Comparamos ${num1} y  ${num2}");
  return num1 > num2 ? num1 : num2;
}

int maximoElementos(List numeros) {
  int maximo = numeros[0];
  for (int i = 0; i < numeros.length; i++) {
    if (numeros[i] > maximo) {
      maximo = numeros[i];
    }
  }
  return maximo;
}

double promediarElementos(List numeros) {
  int suma = 0;
  for (int i = 0; i < numeros.length; i++) {
    suma += numeros[i];
  }
  return suma / numeros.length;
}

void sumarElementos(List numeros) {
  int suma = 0;
  for (int i = 0; i < numeros.length; i++) {
    suma += numeros[i];
  }
  print(suma);
}

void imprimirListaWhile(List lista) {
  int i = 0;
  while (i < lista.length) {
    print("El indice ${i} tiene el valor ${lista[i]}");
    i++;
  }
}

void imprimirLista(List lista) {
  for (int i = 0; i < lista.length; i++) {
    print("El indice ${i} tiene el valor ${lista[i]}");
  }
}
