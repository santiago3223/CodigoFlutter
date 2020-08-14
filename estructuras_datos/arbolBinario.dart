import 'dart:io';
import 'persona.dart';

void main(List<String> args) {
  Arbol<Persona> arbol = new Arbol();
  arbol.Insertar(Persona(id: 15, nombre: "Santiago"));
  arbol.Insertar(Persona(id: 10, nombre: "Frank"));
  arbol.Insertar(Persona(id: 18, nombre: "Daniel"));
  arbol.Insertar(Persona(id: 7, nombre: "Renzo"));
  arbol.Insertar(Persona(id: 9, nombre: "Gerson"));
  arbol.Insertar(Persona(id: 11, nombre: "Wendy"));
  arbol.Insertar(Persona(id: 5, nombre: "Sebastian"));
  arbol.Insertar(Persona(id: 20, nombre: "Orlando"));
  arbol.Insertar(Persona(id: 16, nombre: "Fernando"));
  arbol.Insertar(Persona(id: 14, nombre: "Walter"));
  print(arbol.buscarObjeto(Persona(id: 17)));
  arbol.Imprimir();
}

class Arbol<T> {
  Vertice<T> inicio;

  T buscarObjeto(T valorBuscar) {
    return inicio.buscarObjeto(valorBuscar);
  }

  void Insertar(T valor) {
    Vertice<T> nuevo = new Vertice<T>(valor: valor);
    if (inicio == null) {
      inicio = nuevo;
    } else {
      inicio.agregarVertice(valor);
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

  T buscarObjeto(T valorBuscado) {
    if (valor == valorBuscado) return valor;
    dynamic actualvalor = valor;
    dynamic buscarvalor = valorBuscado;
    if (actualvalor > buscarvalor) {
      if (menor == null) return null;
      return menor.buscarObjeto(valorBuscado);
    } else {
      if (mayor == null) return null;
      return mayor.buscarObjeto(valorBuscado);
    }
  }

  void agregarVertice(T valorNuevo) {
    dynamic actualvalor = valor;
    dynamic nuevovalor = valorNuevo;
    if (actualvalor > nuevovalor) {
      if (menor == null) {
        menor = new Vertice<T>(valor: nuevovalor);
      } else {
        menor.agregarVertice(valorNuevo);
      }
    } else {
      if (mayor == null) {
        mayor = new Vertice<T>(valor: nuevovalor);
      } else {
        mayor.agregarVertice(valorNuevo);
      }
    }
  }

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
