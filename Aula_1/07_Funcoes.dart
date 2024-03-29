// Função convencional
String apresentacaoC(String nome, int idade) {
  return "Olá! Meu nome é $nome e eu tenho $idade anos.\n";
}

// Função anônima
var apresentacaoA = (String nome, int idade) {
  String frase = "Olá! Meu nome é $nome e eu tenho $idade anos.\n";
  return frase;
};

// Função seta
var apresentacaoS = (String nome, int idade) => print("Olá! Meu nome é $nome e eu tenho $idade anos.\n");

void main() {
  print(apresentacaoC("Pedro", 15));
  print(apresentacaoA("Tiago", 20));
  apresentacaoS("João", 16);
}