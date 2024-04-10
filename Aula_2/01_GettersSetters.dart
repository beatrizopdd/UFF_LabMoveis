class Conta {
  // Atributo privado
  double _saldo = 0.0;

  double get saldo {
    return this._saldo;
  }

  set saldo(double saldo) {
    this._saldo = saldo;
  }

}

void main() {
  Conta caixa = Conta();

  // prática ruim
  caixa._saldo = 25.50;
  print(caixa._saldo);

  // boa prática
  caixa.saldo = 56.75;
  print(caixa.saldo);

}