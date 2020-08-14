import 'dart:io';

void main(List<String> args) {
  Grafo g = new Grafo();
  g.agregarArista(2, 5);
  g.agregarArista(7, 2);
  g.agregarArista(2, 1);
  g.agregarArista(5, 3);
  g.agregarArista(3, 1);
  g.agregarArista(5, 7);
  g.imprimir();
  g.imprimirVecinos(2);
}

class Grafo {
  List<Arista> aristas = new List();

  void imprimirVecinos(int n) {
    for (int i = 0; i < aristas.length; i++) {
      if (aristas[i].v1.valor == n) {
        print(aristas[i].v2.valor);
      }
      if (aristas[i].v2.valor == n) {
        print(aristas[i].v1.valor);
      }
    }
  }

  int cantidadVecinos(int n) {
    int cantidad = 0;
    for (int i = 0; i < aristas.length; i++) {
      if (aristas[i].v1.valor == n || aristas[i].v2.valor == n) {
        cantidad++;
      }
    }
    return cantidad;
  }

  Vertice buscarOCrearVertice(int num1) {
    for (int i = 0; i < aristas.length; i++) {
      if (aristas[i].v1.valor == num1) {
        return aristas[i].v1;
      }
      if (aristas[i].v2.valor == num1) {
        return aristas[i].v2;
      }
    }
    Vertice v = new Vertice(valor: num1);
    return v;
  }

  void agregarArista(int num1, int num2) {
    Vertice v1 = buscarOCrearVertice(num1);
    Vertice v2 = buscarOCrearVertice(num2);
    Arista arista = new Arista(v1: v1, v2: v2);
    aristas.add(arista);
  }

  void imprimir() {
    File file = new File('grafo');
    String str = "graph {";
    for (int i = 0; i < aristas.length; i++) {
      str += '${aristas[i].v1.valor} -- ${aristas[i].v2.valor};\n';
    }
    str += "}";
    file.writeAsString(str);
  }
}

class Arista {
  Vertice v1;
  Vertice v2;

  Arista({this.v1, this.v2});
}

class Vertice {
  int valor;
  Vertice({this.valor});
}
