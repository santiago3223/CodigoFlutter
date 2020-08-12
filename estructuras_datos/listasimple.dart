void main(List<String> args) {
  ListaS<int> l = new ListaS();
  l.insertarFin(15);
  l.insertarFin(18);
  l.insertarFin(20);
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

  void insertarInicio(T valor) {}

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

  void insertarPosicion(T valor, int posicion) {}
}
