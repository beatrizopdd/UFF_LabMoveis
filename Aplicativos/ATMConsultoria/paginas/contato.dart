import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  const Contato({super.key});

  static const String nomeDaRota = "/contato";

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("CONTATO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.greenAccent.shade400,
      ),

      body: const Center(
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/detalhe_contato.png")),
            Text("atendimento@atmconsultoria.com.br"),
            Text("Telefone: (21) 4376-9800"),
            Text("Endereço: Rua dos Bobos, 0"),
          ],
        ),
      ),
    );
  }
}