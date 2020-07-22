void main() {
  int edad = 100;
  String sexo = "Robot";
  String tipo = "Staff";
  if (tipo == "Staff") {
    print("Puede ingresar");
  } else if (sexo == "Masculino") {
    if (edad >= 18 && edad <= 35) {
      print("Puede ingresar");
    } else {
      print("No puede ingresar");
    }
  } else {
    if (sexo == "Femenino") {
      if (edad >= 16 && edad <= 35) {
        print("Puede ingresar");
      } else {
        print("No puede ingresar");
      }
    } else {
      print("No puede ingresar");
    }
  }
}
