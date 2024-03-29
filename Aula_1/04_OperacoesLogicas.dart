void main() {
  // Em && e ||, a segunda premissa não precisa ser checada se a primeira ditar o resultado.
  // É possível checar trocando o & por && na linha 8 e | por || na linha 12

  print("Tabela 'and'");
  print("V e V = ${true && true}");
  print("V e F = ${true && false}");
  print("F e V = ${false && true}");
  print("F e F = ${false & false}");

  print("\nTabela 'or'");
  print("V ou V = ${true || true}");
  print("V ou F = ${true | false}");
  print("F ou V = ${false || true}");
  print("F ou F = ${false || false}");

  print("\nTabela 'not'");
  print("não V = ${!true}");
  print("não F = ${!false}");
}