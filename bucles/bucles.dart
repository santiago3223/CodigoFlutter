void main() {
  //Bucle While .- repite lo que esta dentro de llaves mientras que el valor entre parentesis sea verdadero.
  double numero = 1;
  while (5 >= numero) {
    print("Llego aqui ${numero}");
    numero += 1; // === numero = numero + 1;  === numero++;
  }
  print("------------");
  //Bucle Do While.- va a hacer lo del do mientras lo del while sea verdadero.
  numero = 1;
  do {
    print("Llego aqui ${numero}");
    numero += 1;
  } while (5 >= numero);
}
