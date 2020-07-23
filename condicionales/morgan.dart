void main() {
  int nota = 22;
  // if (!(nota<0 || nota>20)) === if (nota >= 0 && nota <= 20)
  if (!(nota < 0 || nota > 20)) {
    if (nota > 10) {
      print("Aprobado");
    } else {
      print("Desaprobado");
    }
  } else {
    print("Nota incorrecta");
  }
}
