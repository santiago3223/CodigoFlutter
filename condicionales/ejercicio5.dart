void main() {
  int nota = 12;
  String description;

  if (nota >= 0 && nota <= 5) {
    description = "Repite";
  } else if (nota <= 10) {
    description = "Desaprobado";
  } else if (nota <= 12) {
    description = "Aprobado";
  } else if (nota <= 14) {
    description = "Regular";
  } else if (nota <= 16) {
    description = "Bueno";
  } else if (nota <= 18) {
    description = "Destacado";
  } else if (nota <= 20) {
    description = "Excelente";
  }

  print("Estado del alumno: ${description}");
}
