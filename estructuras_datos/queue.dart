import 'dart:collection';

void main(List<String> args) {
  Queue<int> c = new Queue();
  c.add(1);
  c.add(2);
  c.add(3);

  print(c.removeFirst());
}
