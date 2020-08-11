void main(List<String> args) {
  List<int> numeros = [1, 3, 5, 7];
  int numero = 16;

  //print(encontrar(numeros, numero));
  print(encontrar2(numeros, numero));
}

bool encontrar(List<int> numeros, int numero) {
  for (int i = 0; i < numeros.length; i++) {
    print("comparar ${numeros[i]}");
    if (numero == numeros[i]) return true;
  }
  for (int i = 0; i < numeros.length; i++) {
    for (int e = i + 1; e < numeros.length; e++) {
      print(
          "comparar ${numeros[i]} y ${numeros[e]} = ${numeros[i] + numeros[e]}");
      if (numero == numeros[i] + numeros[e]) return true;
    }
  }
  for (int i = 0; i < numeros.length; i++) {
    for (int e = i + 1; e < numeros.length; e++) {
      for (int j = e + 1; j < numeros.length; j++) {
        print(
            "comparar ${numeros[i]} y ${numeros[e]}  y ${numeros[j]} = ${numeros[i] + numeros[e] + numeros[j]}");
        if (numero == numeros[i] + numeros[e] + numeros[j]) return true;
      }
    }
  }

  return false;
}

bool encontrar2(List<int> numeros, int numero) {
  List<int> sumas = [];
  for (int i = 0; i < numeros.length; i++) {
    sumas.add(numeros[i]);
    if (numero == numeros[i]) return true;
  }
  print(sumas);

  for (int j = 0; j < numeros.length - 1; j++) {
    List<int> temporal = [];
    for (int i = 0; i < numeros.length; i++) {
      for (int e = i + 1; e < numeros.length; e++) {
        temporal.add(sumas[i] + numeros[e]);
        if (numero == sumas[i] + numeros[e]) return true;
      }
    }
    sumas = temporal;
    print(sumas);
  }
  return false;
}
