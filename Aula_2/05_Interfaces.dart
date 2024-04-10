class Aluno {
  void estudar() => print("Vou estudar!");

  void naoEstudar() => print("Não vou estudar!");
}

class BomAluno extends Aluno {
  // não precisa dar override já que já está implementado
}

// é preciso dar override já que você está implementando
class MauAluno implements Aluno {
  @override
  void estudar() => print("Vou estudar mas não quero!");

  @override
  void naoEstudar() => print("Não quero estudar!");
}

void main() {
  BomAluno pedro = BomAluno();
  pedro.estudar();
  pedro.naoEstudar();

  MauAluno tiago = MauAluno();
  tiago.estudar();
  tiago.naoEstudar();
}