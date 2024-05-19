import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {

  const Resultado({super.key});

  static const String nomeDaRota = "/resultado";

  @override
  State<Resultado> createState() => ResultadoState();
}

class ResultadoState extends State<Resultado> {

  List<String> textos = ["CARA", "COROA"];
  List<String> imagens =  ["assets/images/cara.png", "assets/images/coroa.png"];

  @override
  Widget build(BuildContext context) {

    int escolha = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "CARA OU COROA",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagens[escolha])),

            const SizedBox(height: 10),

            Text(
              textos[escolha],
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}