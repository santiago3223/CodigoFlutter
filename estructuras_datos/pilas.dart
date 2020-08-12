main(List<String> args) {
  String expresion = "(a+[(b*5-[(a(7)+(35*5))])])";
  print(estaBalanceado(expresion));
}

bool estaBalanceado(String expresion) {
  Pila<String> p = new Pila();
  for (int i = 0; i < expresion.length; i++) {
    if (expresion[i] == "(") p.Push("(");
    if (expresion[i] == ")") {
      if (p.Pop() != "(") return false;
    }
    if (expresion[i] == "[") p.Push("[");
    if (expresion[i] == "]") {
      if (p.Pop() != "[") return false;
    }
  }
  return p.estaVacio();
}

class Nodo<E> {
  E valor;
  Nodo<E> anterior;
  Nodo({this.valor, this.anterior});
}

class Pila<T> {
  Nodo<T> superior = null;

  void Push(T n) {
    Nodo<T> nodo = new Nodo(valor: n, anterior: superior);
    superior = nodo;
  }

  T Pop() {
    T valor = superior.valor;
    superior = superior.anterior;
    return valor;
  }

  bool estaVacio() {
    return superior == null;
  }
}
