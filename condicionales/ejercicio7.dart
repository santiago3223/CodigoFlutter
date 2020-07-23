void main() {
  int edad = -15;
  if (edad < 0) {
    print("Su edad no existe, no mienta");
  } else if (edad < 4) {
    print("Entra gratis");
  } else if (edad < 18) {
    print("Paga 5 soles");
  } else {
    print("Paga 10 soles");
  }
}
