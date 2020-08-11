class Fecha {
  int dia;
  int mes;
  int anio;

  Fecha(int dia, int mes, int anio) {
    this.dia = dia;
    this.mes = mes;
    this.anio = anio;
  }

  bool esValida() => diaEsValido() && mesEsValido();

  bool mesEsValido() => mes > 0 && mes <= 12;

  bool diaEsValido() {
    if (dia <= 0) return false;
    if (mes == 1) return dia <= 31;
    if (mes == 2 && !esBisiesto()) return dia <= 28;
    if (mes == 2 && esBisiesto()) return dia <= 29;
    if (mes == 3) return dia <= 31;
    if (mes == 4) return dia <= 30;
    if (mes == 5) return dia <= 31;
    if (mes == 6) return dia <= 30;
    if (mes == 7) return dia <= 31;
    if (mes == 8) return dia <= 31;
    if (mes == 9) return dia <= 30;
    if (mes == 10) return dia <= 31;
    if (mes == 11) return dia <= 30;
    if (mes == 12) return dia <= 31;
  }

  bool esBisiesto() => anio % 4 == 0 && anio % 100 != 100 || anio % 400 == 0;

  String toString() => "${dia}/${mes}/${anio}";
  String imprimirPalabras() => "";
  String imprimirAmericano() => "${mes}/${dia}/${anio}";

  int operator -(Fecha f) {
    int f1 = (anio * 365.256363).floor() + mes * 30 + dia;
    int f2 = (f.anio * 365.256363).floor() + f.mes * 30 + f.dia;

    return f1 - f2;
  }
}
