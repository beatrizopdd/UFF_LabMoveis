import 'package:flutter/material.dart';
import 'dart:math';

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => Aparencia();
}

class Aparencia extends State<Jokenpo> {

  List<Image> imagens = [
    Image.asset("assets/imagens/pedra.png"),
    Image.asset("assets/imagens/papel.png"),
    Image.asset("assets/imagens/tesoura.png"),
    Image.asset("assets/imagens/padrao.png"),
  ];
  List<String> textos = [
    "ESCOLHA SEU MOVIMENTO",
    "VOCÊ VENCEU!",
    "ROBÔ VENCEU!",
    "EMPATE!",
  ];

  int escolhaRobo = 3;
  int escolhaUsuario = 3;
  int escolhaTexto = 0;

  void resultado() {
    setState((){
      escolhaRobo = Random().nextInt(imagens.length - 1);

      if ((escolhaUsuario == 0 && escolhaRobo == 2) || (escolhaUsuario == 1 && escolhaRobo == 0) || (escolhaUsuario == 2 && escolhaRobo == 1))
        escolhaTexto = 1;
      else if ((escolhaUsuario == 0 && escolhaRobo == 1) || (escolhaUsuario == 1 && escolhaRobo == 2) || (escolhaUsuario == 2 && escolhaRobo == 0))
        escolhaTexto = 2;
      else if (escolhaUsuario == escolhaRobo)
        escolhaTexto = 3;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JOKENPO", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Você x Robô",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: imagens.elementAt(escolhaUsuario),
                  width: 150,
                ),
                const SizedBox(width: 15),
                Container(
                  child: imagens.elementAt(escolhaRobo),
                  width: 150,
                ),
              ],
            ),

            const SizedBox(height: 50),

            Text(textos.elementAt(escolhaTexto),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      escolhaUsuario = 0;
                      resultado();
                    });
                  },
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(CircleBorder())),
                  child: SizedBox(
                    width: 80,
                    child: Image.asset("assets/imagens/pedra.png"),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      escolhaUsuario = 1;
                      resultado();
                    });
                  },
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(CircleBorder())),
                  child: SizedBox(
                    width: 80,
                    child: Image.asset("assets/imagens/papel.png"),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      escolhaUsuario = 2;
                      resultado();
                    });
                  },
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(CircleBorder())),
                  child: SizedBox(
                    width: 80,
                    child: Image.asset("assets/imagens/tesoura.png"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

}