/*
Implemente una clase llamada Hora, 
que como atributos tenga horas, y minutos
tenga un constructor en formato 12 horas y uno en formato 24 horas
tenga metodos para imprimir en formato 24 horas y en 12 horas
sobrecargue el método - (resta) para poder obtener la diferencia entre dos horas
*/
main(List<String> args) {
  Hora h = Hora.formato12H(10, 40, "pm");
  Hora h2 = Hora.formato24H(11, 20);
  h.imprimir12H();
  h.imprimir24H();
  h2.imprimir12H();
  h2.imprimir24H();
  print(h - h2);
}

class Hora {
  int horas;
  int minutos;

  Hora.formato24H(int horas, int minutos) {
    this.horas = horas;
    this.minutos = minutos;
  }

  Hora.formato12H(int horas, int minutos, String horario) {
    if (horario == "pm") {
      horas += 12;
    }
    this.horas = horas;
    this.minutos = minutos;
  }

  void imprimir24H() {
    print("${horas}: ${minutos}");
  }

  void imprimir12H() {
    if (horas <= 12) {
      print("${horas}: ${minutos} a.m");
    } else {
      print("${horas - 12}: ${minutos} p.m");
    }
  }

  int operator -(Hora h2) {
    int difmin = (horas * 60 + minutos) - (h2.horas * 60 + h2.minutos);
    return difmin;
  }
}
