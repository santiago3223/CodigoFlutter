import 'dart:math';

main(List<String> args) {
  String expresion = "(a+[(b*5-[(a(7)+(35*5)]))])";
  print(estaBalanceado(expresion));
}

bool estaBalanceado(String expresion) {
  Pila p = new Pila();
  for (int i = 0; i < expresion.length; i++) {
    if (expresion[i] == "(") p.Push(1);
    if (expresion[i] == ")") p.Pop();
  }
  return p.estaVacio();
}

class Nodo {
  int valor;
  Nodo anterior;
  Nodo({this.valor, this.anterior});
}

class Pila {
  Nodo superior = null;

  void Push(int n) {
    Nodo nodo = new Nodo(valor: n, anterior: superior);
    superior = nodo;
  }

  int Pop() {
    int valor = superior.valor;
    superior = superior.anterior;
    return valor;
  }

  bool estaVacio() {
    return superior == null;
  }
}
