class Ficha {
  late String _nome = "Usuário";
  late int _idade = 0;
  late int _anoDeNascimento = 2024;

  String get nome => _nome;
  set nome(String n) {_nome = n;}

  int get idade => _idade;
  set idade(int i) {
    _idade = i;
    _anoDeNascimento = 2024 - i;
  }

  int get nascimento => _anoDeNascimento;
}