class Perfil {
  static String nome = "João do Barquinho";
  final String senha = "deznopequenobote";

  static void login() {
    print("Fazendo login...");
  }
}

void main() {
  Perfil perfil = Perfil();

  // O atributo static é da classe e não da instância
  //print("nome de perfil: ${perfil.nome}");
  print("nome de Perfil: ${Perfil.nome}");
  Perfil.nome = "Tiago do Barquinho";
  print("nome de Perfil: ${Perfil.nome}");

  // O atributo final não pode ser modificado
  //perfil.senha = "pedrotiagojoaonobarquinho";
  print("senha de perfil: ${perfil.senha}");

  // O método static é da classe e não da instância
  //perfil.login();
  Perfil.login();
}