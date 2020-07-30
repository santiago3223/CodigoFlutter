import 'dart:math';

void main() {
  int n = 4;
  int caraExterna1 = n * n;
  int caraExterna2 = n * n;

  int caraInterna = n + n + 2 * (n - 2);
  int cantCarasInternas = n - 2;

  int res = caraExterna1 + caraExterna2 + caraInterna * cantCarasInternas;

  print(res);
  print(pow(n, 3) - pow(n - 2, 3));
}
