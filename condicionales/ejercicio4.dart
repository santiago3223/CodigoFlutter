void main(List<String> args) {
  double sueldo = 20000;
  double porcentaje;
  String mostrar;

  if (sueldo <= 0) {
    mostrar = "Sueldo Inválido";
  } else if (sueldo < 10000) {
    porcentaje = 0.03;
  } else if (sueldo < 20000) {
    porcentaje = 0.07;
  } else if (sueldo < 30000) {
    porcentaje = 0.09;
  } else if (sueldo < 40000) {
    porcentaje = 0.13;
  } else if (sueldo < 50000) {
    porcentaje = 0.16;
  } else {
    porcentaje = 0.20;
  }

  double sueldoneto = sueldo * (1 - porcentaje);

  mostrar =
      "El sueldo es ${sueldo} y el impuesto es el ${porcentaje}% sueldo Neto: ${sueldoneto}";

  print(mostrar);
}
