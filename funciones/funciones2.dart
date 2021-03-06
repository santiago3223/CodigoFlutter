import 'dart:math';

String respuesta = "";
void main() {
  List<int> l1 = [0, 0, 0, 0, 0];
  List<int> l2 = [9, 8, 5, 6, 7];
  print(distanciaEuclideana(l1, l2));
  print(distanciaCamberra(l1, l2));
}

double distanciaCamberra(List l1, List l2) {
  double dist = 0;
  for (int i = 0; i < l1.length; i++) {
    dist += (l1[i] - l2[i]).abs();
  }
  return dist;
}

double distanciaEuclideana(List l1, List l2) {
  double dist = 0;
  for (int i = 0; i < l1.length; i++) {
    dist += pow(l1[i] - l2[i], 2);
  }
  return sqrt(dist);
}

List<int> ordenarBurbuja(List<int> lista) {
  for (int e = 0; e < lista.length - 1; e++) {
    for (int i = 0; i < lista.length - 1 - e; i++) {
      if (lista[i] > lista[i + 1]) {
        int temp = lista[i];
        lista[i] = lista[i + 1];
        lista[i + 1] = temp;
      }
    }
    print(lista);
  }
  return lista;
}

List<int> ordenar(List<int> lista) {
  List<int> nuevo = [];
  int menor = lista[0];
  int size = lista.length;
  for (int e = 0; e < size; e++) {
    for (int i = 0; i < lista.length; i++) {
      if (menor > lista[i]) {
        menor = lista[i];
      }
    }
    lista.remove(menor);
    nuevo.add(menor);
    if (lista.length > 0) {
      menor = lista[0];
    }
  }
  return nuevo;
}

int arbolfibonacci3(int numero, [int nivel = 1]) {
  if (numero == 0) {
    return 0;
  }
  if (numero == 1) {
    return 1;
  }
  int primerAnterior = arbolfibonacci3(numero - 1, nivel + 1);
  respuesta = "\t" * nivel + primerAnterior.toString() + "\n" + respuesta;
  int segundoAnterior = arbolfibonacci3(numero - 2, nivel + 1);
  respuesta = "\t" * nivel + segundoAnterior.toString() + "\n" + respuesta;
  return primerAnterior + segundoAnterior;
}

int arbolfibonacci(int i, int espacios) {
  if (i == 0) {
    return 0;
  }
  if (i == 1) {
    return 1;
  }
  int f1 = arbolfibonacci(i - 1, espacios + 1);
  respuesta = ("\t" * espacios) + f1.toString() + "\n" + respuesta;
  int f2 = arbolfibonacci(i - 2, espacios + 1);
  respuesta = ("\t" * espacios) + f2.toString() + "\n" + respuesta;
  return f1 + f2;
}

int arbolfibonacci2(int i, int espacios) {
  if (i == 0) {
    return 0;
  }
  if (i == 1) {
    return 1;
  }
  int f1 = arbolfibonacci2(i - 1, espacios + 1);
  int f2 = arbolfibonacci2(i - 2, espacios + 1);
  respuesta = ("\t" * espacios) + (f1 + f2).toString() + "\n" + respuesta;

  return f1 + f2;
}

int relacion(int a, int b) {
  if (a > b) return 1;
  if (a < b) return -1;
  return 0;
}

double areaCirculo(int radio) => radio * radio * 3.1415926549;

int areaRectangulo(int base, int altura) => base * altura;

int CambiarInt(int s) {
  s += 15;
  return s;
}

int maximoComunDivisorRecursivo(int numero1, int numero2) {
  if (numero1 % numero2 == 0) {
    return numero2;
  }
  return maximoComunDivisorRecursivo(numero2, numero1 % numero2);
}

int maximoComunDivisorIterativo(int numero1, int numero2) {
  while (numero1 % numero2 != 0) {
    int temp = numero1 % numero2;
    numero1 = numero2;
    numero2 = temp;
  }
  return numero2;
}

int maximoComunDivisor(int numero1, int numero2) {
  int numMenor = numero1;
  if (numero1 > numero2) {
    numMenor = numero2;
  }
  for (int i = numMenor; i > 0; i--) {
    if (numero1 % i == 0 && numero2 % i == 0) {
      return i;
    }
  }
}

//fibonacci usando bucles

int fibonacci(int numero) {
  if (numero == 0) {
    return 0;
  }
  if (numero == 1) {
    return 1;
  }
  return fibonacci(numero - 1) + fibonacci(numero - 2);
}

int factorialRecursivo(int numero) {
  print(numero);
  if (numero == 1) {
    return 1;
  }
  return numero * factorialRecursivo(numero - 1);
}

int factorial(int numero) {
  int respuesta = 1;
  for (int i = 1; i <= numero; i++) {
    respuesta = respuesta * i;
  }
  return respuesta;
}

void imprimirNombre(String nombre) {
  print(nombre);
  imprimirNombre(nombre);
}

String ObtenerToken(String usuario) {
  String respuesta = "";
  for (int i = 0; i < usuario.length; i++) {
    respuesta += usuario[usuario.length - i - 1];
  }
  return respuesta;
}

int previoPrimo(int numero) {
  numero = numero - 1;
  while (true) {
    if (esPrimo(numero)) {
      return numero;
    }
    numero--;
  }
}

bool esPrimo(int numero) {
  int divisor = 2;
  while (divisor < numero) {
    if (numero % divisor == 0) {
      return false;
    }
    divisor++;
  }
  return true;
}

double fahrenheitACelcius(double gradosFarhenheit) {
  return (gradosFarhenheit - 32) * 5 / 9;
}

int mayor(int numero1, int numero2) {
  if (numero1 > numero2) {
    return numero1;
  } else {
    return numero2;
  }
}
