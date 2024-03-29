// Espaço para testar atributos e métodos de cada tipo de coleção
void main() {
  List<String> compras = ["pera", "uva", "maçã", "abacate"];
  print("Lista de compras: ${compras}");

  Set<String> corpo = {"cabeça", "ombro", "joelho", "pé"};
  print("Conjunto corpo: ${corpo}");

  Map<int, String> ddd = {
    21: "Rio de Janeiro",
    11: "São Paulo",
    31: "Minas Gerais",
    27: "Espírito Santo",
  };
  print("Tabela de DDDs: ${ddd}");

}