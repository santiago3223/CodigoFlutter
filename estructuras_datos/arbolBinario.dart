import 'dart:io';

void main(List<String> args) {
  Arbol<int> arbol = new Arbol();
  arbol.Insertar(15);
  arbol.Insertar(10);
  arbol.Imprimir();
}

class Arbol<T> {
  Vertice<T> inicio;

  void Insertar(T valor) {
    Vertice<T> nuevo = new Vertice<T>(valor: valor);
    if (inicio == null) {
      inicio = nuevo;
    } else {
      dynamic actualvalor = inicio.valor;
      dynamic nuevovalor = valor;
      if (actualvalor > nuevovalor) {
        inicio.menor = nuevo;
      } else {
        inicio.mayor = nuevo;
      }
    }
  }

  void Imprimir() {
    File file = new File('grafo');
    String str = "graph {";
    str += inicio.imprimir(inicio.valor);
    str += "}";
    file.writeAsString(str);
  }
}

class Vertice<T> {
  T valor;
  Vertice<T> menor;
  Vertice<T> mayor;

  Vertice({this.valor, this.menor, this.mayor});

  String imprimir(T v) {
    String str = "";
    str += '${v} -- ${valor};\n';
    if (menor != null) {
      str += menor.imprimir(valor);
    }
    if (mayor != null) {
      str += mayor.imprimir(valor);
    }
    return str;
  }
}
