import 'dart:math';
import 'package:flutter/material.dart';
import 'configuracao.dart';

class Tabuleiro4 extends StatefulWidget {
  Tabuleiro4({super.key});

  static const String nomeDaRota = "/tabuleiro4";

  @override
  State<Tabuleiro4> createState() => _TabuleiroState();
}

class _TabuleiroState extends State<Tabuleiro4> {

  late Configuracao configuracao;

  bool emJogo = true;
  bool vezDoUsuario = true;
  late String mensagem = "VEZ DE ${configuracao.apelido}";
  Color mensagemCor = Colors.blue.shade900;
  int ocupadas = 0;

  // Matriz com a presença nas casas: -1 robô, 0 ninguém, 1 usuário
  List<List<int>> jogadas = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
  // Matriz com o conteúdo das casas
  List<List<Widget>> tabuleiro = [
    [Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    )],
    [Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    )],
    [Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    )],
    [Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    ),Container(
      width: 80,
      height: 80,
      color: Colors.grey,
    )],
  ];

  void jogar(int l, int c) {
    if (emJogo == true && jogadas[l][c] == 0) {
      tabuleiro[l][c] = Container(
        width: 80,
        height: 80,
        color: Colors.green,
        child: Icon(configuracao.marcadorUsuario, color: Colors.white, size: 70),
      );
      jogadas[l][c] = 1;
      vezDoUsuario = false;
      ocupadas++;
      emJogo = checar();

      if (emJogo == true) {
        do {
          l = Random().nextInt(4);
          c = Random().nextInt(4);
        } while (jogadas[l][c] == -1 || jogadas[l][c] == 1);
        tabuleiro[l][c] = Container(
          width: 80,
          height: 80,
          color: Colors.orange.shade300,
          child: Icon(configuracao.marcadorRobo, color: Colors.white, size: 70),
        );
        jogadas[l][c] = -1;
        vezDoUsuario = true;
        ocupadas++;
        emJogo = checar();
      }

      setState(() {});
    }
  }

  bool checar() {
    // HORIZONTAL
    if ((jogadas[0][0] == 1 && jogadas[0][1] == 1 && jogadas[0][2] == 1 && jogadas[0][3] == 1) ||
        (jogadas[1][0] == 1 && jogadas[1][1] == 1 && jogadas[1][2] == 1 && jogadas[1][3] == 1) ||
        (jogadas[2][0] == 1 && jogadas[2][1] == 1 && jogadas[2][2] == 1 && jogadas[2][3] == 1) ||
        (jogadas[3][0] == 1 && jogadas[3][1] == 1 && jogadas[3][2] == 1 && jogadas[3][3] == 1)) {
      mensagem = "VITÓRIA DE ${configuracao.apelido}!";
      mensagemCor = Colors.green;
      return false;
    }

    if ((jogadas[0][0] == -1 && jogadas[0][1] == -1 && jogadas[0][2] == -1 && jogadas[0][3] == -1) ||
        (jogadas[1][0] == -1 && jogadas[1][1] == -1 && jogadas[1][2] == -1 && jogadas[1][3] == -1) ||
        (jogadas[2][0] == -1 && jogadas[2][1] == -1 && jogadas[2][2] == -1 && jogadas[2][3] == -1) ||
        (jogadas[3][0] == -1 && jogadas[3][1] == -1 && jogadas[3][2] == -1 && jogadas[3][3] == -1)) {
      mensagem = "VITÓRIA DE ROBÔ!";
      mensagemCor = Colors.orange;
      return false;
    }

    // VERTICAL
    if ((jogadas[0][0] == 1 && jogadas[1][0] == 1 && jogadas[2][0] == 1 && jogadas[3][0] == 1) ||
        (jogadas[0][1] == 1 && jogadas[1][1] == 1 && jogadas[2][1] == 1 && jogadas[3][1] == 1) ||
        (jogadas[0][2] == 1 && jogadas[1][2] == 1 && jogadas[2][2] == 1 && jogadas[3][2] == 1) ||
        (jogadas[0][3] == 1 && jogadas[1][3] == 1 && jogadas[2][3] == 1 && jogadas[3][3] == 1)) {
      mensagem = "VITÓRIA DE ${configuracao.apelido}!";
      mensagemCor = Colors.green;
      return false;
    }

    if ((jogadas[0][0] == -1 && jogadas[1][0] == -1 && jogadas[2][0] == -1 && jogadas[3][0] == -1) ||
        (jogadas[0][1] == -1 && jogadas[1][1] == -1 && jogadas[2][1] == -1 && jogadas[3][1] == -1) ||
        (jogadas[0][2] == -1 && jogadas[1][2] == -1 && jogadas[2][2] == -1 && jogadas[3][2] == -1) ||
        (jogadas[0][3] == -1 && jogadas[1][3] == -1 && jogadas[2][3] == -1 && jogadas[3][3] == -1)) {
      mensagem = "VITÓRIA DE ROBÔ!";
      mensagemCor = Colors.orange;
      return false;
    }

    // DIAGONAL
    if ((jogadas[0][0] == 1 && jogadas[1][1] == 1 && jogadas[2][2] == 1 && jogadas[3][3] == 1) ||
        (jogadas[3][0] == 1 && jogadas[2][1] == 1 && jogadas[1][2] == 1 && jogadas[0][3] == 1)) {
      mensagem = "VITÓRIA DE ${configuracao.apelido}!";
      mensagemCor = Colors.green;
      return false;
    }

    if ((jogadas[0][0] == -1 && jogadas[1][1] == -1 && jogadas[2][2] == -1 && jogadas[3][3] == -1) ||
        (jogadas[3][0] == -1 && jogadas[2][1] == -1 && jogadas[1][2] == -1 && jogadas[0][3] == -1)) {
      mensagem = "VITÓRIA DE ROBÔ!";
      mensagemCor = Colors.orange;
      return false;
    }

    if (ocupadas == 16) {
      mensagem = "DEU VELHA!";
      mensagemCor = Colors.blue;
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {

    configuracao = ModalRoute.of(context)!.settings.arguments as Configuracao;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JOGO DA VELHA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: SizedBox(
          width: 381,
          height: 481,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Texto
              Container(
                width: 360,
                decoration: BoxDecoration(border: Border.all(color: mensagemCor, width: 2)),
                alignment: Alignment.center,
                child: Text(
                  mensagem,
                  style: const TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
                ),
              ),

              const SizedBox(height: 10),

              // Casas 0, 1, 2, 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ({int l = 0, int c = 0}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[0][0],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 0, int c = 1}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[0][1],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 0, int c = 2}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[0][2],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 0, int c = 3}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[0][3],
                  ),
                ],
              ),

              SizedBox(width: 360, height: 1, child: Container(color: Colors.black)),

              // Casas 4, 5, 6, 7
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ({int l = 1, int c = 0}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[1][0],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 1, int c = 1}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[1][1],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 1, int c = 2}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[1][2],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 1, int c = 3}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[1][3],
                  ),
                ],
              ),

              SizedBox(width: 360, height: 1, child: Container(color: Colors.black)),

              // Casas 8, 9, 10, 11
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ({int l = 2, int c = 0}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[2][0],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 2, int c = 1}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[2][1],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 2, int c = 2}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[2][2],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 2, int c = 3}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[2][3],
                  ),
                ],
              ),

              SizedBox(width: 360, height: 1, child: Container(color: Colors.black)),

              // Casas 12, 13, 14, 15
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ({int l = 3, int c = 0}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[3][0],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 3, int c = 1}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[3][1],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 3, int c = 2}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[3][2],
                  ),
                  SizedBox(width: 1, height: 90, child: Container(color: Colors.black)),
                  ElevatedButton(
                    onPressed: ({int l = 3, int c = 3}) {jogar(l, c);},
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    child: tabuleiro[3][3],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Button Novo Jogo
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade900)),
                onPressed: (){Navigator.pop(context);},
                child: const Text(
                  "NOVO JOGO",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}