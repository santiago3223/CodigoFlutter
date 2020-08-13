/*Escribe una función que encuentre todos los anagramas de una palabra de una lista. Se le darán dos entradas, 
una palabra y una matriz con palabras. Debe devolver una matriz de todos los anagramas o una matriz vacía si no 
hay ninguna. Por ejemplo:
anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']
anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']
anagrams('laser', ['lazing', 'lazy',  'lacer']) => []
*/

void main(List<String> args) {
  print(anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']));
}

String ordenarPalabra(String s) {
  List letras = s.split("");
  letras.sort();
  return letras.join();
}

bool esAnagrama(String s1, String s2) {
  if (s1.length != s2.length) return false;
  String s1ordenado = ordenarPalabra(s1);
  String s2ordenado = ordenarPalabra(s2);

  return s1ordenado == s2ordenado;
}

List<String> anagrams(String palabra, List<String> opciones) {
  int cont = 0;
  while (cont < opciones.length) {
    print(
        opciones[cont] + " " + esAnagrama(palabra, opciones[cont]).toString());
    cont++;
  }
}
