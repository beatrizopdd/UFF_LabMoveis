import 'dart:io';

void main() {

  // Entrada de dados
  // String? = String ou null
  // linha! = null check
  print("Digite um número: ");
  String? linha = stdin.readLineSync();
  int numero = int.parse(linha!);

  if (numero < 10)
    print("$numero é menor que 10");
  else
    print("$numero é maior ou igual que 10");

  print("\nDigite um operador (/,*,-,+): ");
  String? operacao = stdin.readLineSync();

  switch (operacao) {
    case "+":
      print("Adição");
      break;
    case "-":
      print("Subtração");
      break;
    case "*":
      print("Multiplicação");
      break;
    case "/":
      print("Divisão");
      break;
    default:
      print("Operação inválida!");
  }
}