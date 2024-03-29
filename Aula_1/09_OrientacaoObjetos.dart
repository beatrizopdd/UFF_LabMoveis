// Classe abstrata
class Animal {
  String nome;
  String cor;
  int idade;

  Animal(this.nome, this.cor, this.idade);
  
  void comer() => print("$nome está comendo!");
  
}

class Gato extends Animal {
  
  Gato(super.nome, super.cor, super.idade);
  
  void miar() => print("$nome está miando!");
}

class Passaro extends Animal {

  Passaro(super.nome, super.cor, super.idade);

  void piar() => print("$nome está piando!");
  void voar() => print("$nome está voando!");
}

void main() {
  
  Gato frajola = Gato("Frajola", "Preto", 23);
  print("Nome: ${frajola.nome}");
  print("Cor: ${frajola.cor}");
  print("Idade: ${frajola.idade}\n");

  frajola.comer();
  frajola.miar();

  Animal piupiu = Passaro("Piu-piu", "Amarelo", 15);
  print("\nNome: ${piupiu.nome}");
  print("Cor: ${piupiu.cor}");
  print("Idade: ${piupiu.idade}\n");

  piupiu.comer();

  Passaro blue = Passaro("Blue", "Azul", 20);
  print("\nNome: ${blue.nome}");
  print("Cor: ${blue.cor}");
  print("Idade: ${blue.idade}\n");

  blue.comer();
  blue.piar();
  blue.voar();


}
