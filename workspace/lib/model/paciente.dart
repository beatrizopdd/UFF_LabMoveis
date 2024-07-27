class Paciente {
  late String _nome;
  late int _idade;
  late String _email;
  late int _cpf;

  Paciente(this._nome, this._idade, this._email, this._cpf);

  factory Paciente.toClass(Map<String, dynamic> dados) {
    return Paciente(
      dados["nome"],
      dados["idade"],
      dados["email"],
      dados["cpf"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": this._nome,
      "idade": this._idade,
      "email": this._email,
      "cpf": this._cpf,
    };
  }

  String get nome => _nome;
  int get idade => _idade;
  String get email => _email;
  int get cpf => _cpf;

  set nome(String n) {
    _nome = n;
  }

  set idade(int i) {
    _idade = i;
  }

  set email(String e) {
    _email = e;
  }

  set cpf(int c) {
    _cpf = c;
  }
}
