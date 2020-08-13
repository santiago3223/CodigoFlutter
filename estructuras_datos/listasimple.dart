void main(List<String> args) {
  ListaS<int> l = new ListaS();
  l.insertarFin(15);
  l.insertarFin(18);
  l.insertarPosicion(10, 100);
  l.imprimir();
}

class Nodo<T> {
  T valor;
  Nodo<T> siguiente;
  Nodo({this.valor, this.siguiente});
}

class ListaS<T> {
  Nodo<T> inicio;
  Nodo<T> fin;

  void imprimir() {
    Nodo tmp = inicio;
    while (tmp != null) {
      print(tmp.valor);
      tmp = tmp.siguiente;
    }
  }

  void eliminarPrimero() {
    inicio = inicio.siguiente;
  }

  void insertarInicio(T valor) {
    Nodo<T> n = Nodo(valor: valor, siguiente: inicio);
    inicio = n;
    if (fin == null) {
      fin = n;
    }
  }

  void insertarFin(T valor) {
    Nodo<T> n = Nodo(valor: valor);
    if (fin == null) {
      fin = n;
      inicio = n;
    } else {
      fin.siguiente = n;
      fin = n;
    }
  }

  void insertarPosicion(T valor, int posicion) {
    if (posicion == 0) {
      insertarInicio(valor);
    } else {
      Nodo<T> actual = inicio;
      for (int i = 1; i < posicion && actual.siguiente != null; i++) {
        actual = actual.siguiente;
      }
      Nodo<T> n = Nodo(valor: valor, siguiente: actual.siguiente);
      actual.siguiente = n;
    }
  }
}
