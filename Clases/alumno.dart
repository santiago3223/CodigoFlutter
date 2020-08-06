class Alumno {
  int codigo;
  String nombres;
  String apellidos;
  String genero;
  double notaFinal;

  Alumno(
      {this.codigo, this.nombres, this.apellidos, this.genero, this.notaFinal});

  String toString() {
    return "${codigo} - ${genero} ${apellidos}, ${nombres} : ${notaFinal}";
  }
}
