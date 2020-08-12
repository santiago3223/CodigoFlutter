main(List<String> args) {
  Cola<int> c = new Cola();
  c.Push(1);
  c.Push(2);
  c.Push(3);
  c.Push(100);
  print(c.Pop());
}

class Nodo<E> {
  E valor;
  Nodo<E> siguiente;
  Nodo({this.valor, this.siguiente});
}

class Cola<E> {
  Nodo<E> primero;
  Nodo<E> ultimo;

  void Push(E valor) {
    Nodo<E> n = Nodo(valor: valor);
    if (ultimo == null) {
      ultimo = n;
      primero = n;
    } else {
      ultimo.siguiente = n;
      ultimo = n;
    }
  }

  E Pop() {
    E resultado = primero.valor;
    primero = primero.siguiente;
    return resultado;
  }
}
