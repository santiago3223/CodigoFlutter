void main(List<String> args) {
  int anio = 2001;
  int mes = 2;

  switch (mes) {
    case 1:
      print(31);
      break;
    case 2:
      if (anio % 400 == 0 || (anio % 4 == 0 && anio % 100 != 0)) {
        print(29);
      } else {
        print(28);
      }
      break;
    case 3:
      print(31);
      break;
    case 4:
      print(30);
      break;
    case 5:
      print(31);
      break;
    case 6:
      print(30);
      break;
    case 7:
      print(31);
      break;
    case 8:
      print(31);
      break;
    case 9:
      print(30);
      break;
    case 10:
      print(31);
      break;
    case 11:
      print(30);
      break;
    case 12:
      print(31);
      break;
  }
}
