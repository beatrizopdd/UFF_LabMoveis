void main() {

  // Utilizar ponto e vírgula após cada comando
  // Declarar o tipo da variável
  String palavra = "casa";
  int inteiro = 10;
  double decimal = 3.1415;
  bool booleano = false;

  // Formatar a saída utilizando ("$variavelSimples ou ${operando1 + operando2} ou ${instancia.método}")
  print("$palavra é do tipo: ${palavra.runtimeType}");
  print("$inteiro é do tipo: ${inteiro.runtimeType}");
  print("$decimal é do tipo: ${decimal.runtimeType}");
  print("$booleano é do tipo: ${booleano.runtimeType}\n");

  // O tipo dynamic não guarda somente um tipo de variável mas ela deve ser inicializada
  // Formatar a saída utilizando (variavelString + " ou " + variavelNãoString.toString())
  dynamic variavelD = 3;
  print("Troca 1: " + variavelD.toString() + " é do tipo: " + variavelD.runtimeType.toString());

  variavelD = "três";
  print("Troca 2: " + variavelD + " é do tipo: " + variavelD.runtimeType.toString());

  variavelD = 3.0;
  print("Troca 3: " + variavelD.toString() + " é do tipo: " + variavelD.runtimeType.toString());

  variavelD = true;
  print("Troca 4: " + variavelD.toString() + " é do tipo: " + variavelD.runtimeType.toString() + "\n");

  // O tipo var não guarda somente um tipo de variável mas ela NÃO deve ser inicializada
  var variavelV;
  variavelV = 4;
  print("Troca 1: " + variavelV.toString() + " é do tipo: " + variavelV.runtimeType.toString());

  variavelV = "quatro";
  print("Troca 2: " + variavelV + " é do tipo: " + variavelV.runtimeType.toString());

  variavelV = 4.0;
  print("Troca 3: " + variavelV.toString() + " é do tipo: " + variavelV.runtimeType.toString());

  variavelV = false;
  print("Troca 4: " + variavelV.toString() + " é do tipo: " + variavelV.runtimeType.toString());
}