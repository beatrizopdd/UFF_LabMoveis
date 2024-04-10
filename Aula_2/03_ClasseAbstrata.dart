// Algo deve fazer esses métodos mas eu não sei como então deixo para eles implementarem
abstract class Aluno {
  void estudar();
  void naoEstudar();
}

class BomAluno extends Aluno {
  @override
  void estudar() {
    print("Um bom aluno está estudando");
  }

  @override
  void naoEstudar() {
    print("Um bom aluno NÃO QUIS não estudar");
  }
}

class MauAluno extends Aluno {
  @override
  void estudar() {
    print("Um mau aluno NÃO QUIS estudar");
  }

  @override
  void naoEstudar() {
    print("Um mau aluno não está estudando");
  }
}

// É obrigatório dar override em todos os métodos da classe abstrata já que eles
// não foram implementados
void main() {
  BomAluno pedro = BomAluno();
  pedro.estudar();
  pedro.naoEstudar();

  MauAluno tiago = MauAluno();
  tiago.estudar();
  tiago.naoEstudar();
}