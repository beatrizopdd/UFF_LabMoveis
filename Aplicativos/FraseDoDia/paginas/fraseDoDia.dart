import 'package:flutter/material.dart';
import 'dart:math';

class FraseDoDia extends StatefulWidget {
  const FraseDoDia({super.key});

  @override
  State<FraseDoDia> createState() => Aparencia();
}

class Aparencia extends State<FraseDoDia> {

  List<String> frases = [
    "Para bom entendedor, meia palavra basta",
    "De grão em grão, a galinha enche o papo",
    "Cada macaco no seu galho",
    "Casa de ferreiro, espeto de pau",
    "Água mole, pedra dura, tanto bate até que fura",
    "Filho de peixe, peixinho é",
    "Deus ajuda quem cedo madruga",
    "Onde há fumaça há fogo",
    "Cão que ladra não morde",
    "Pimenta nos olhos dos outros é refresco",
  ];

  String frase = "Clique no botão abaixo para gerar uma frase!";
  void atualizaFrase(){
    setState(() {
      int indx = Random().nextInt(frases.length);
      frase = frases.elementAt(indx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FRASES ALEATÓRIAS", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/imagens/fraseDoDia.png"),
              width: 325,
            ),

            const SizedBox(height: 50),

            Text("$frase",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: atualizaFrase,
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text(
                "DESCOBRIR FRASE",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            )
          ],
        ),
      ),
    );
  }

}