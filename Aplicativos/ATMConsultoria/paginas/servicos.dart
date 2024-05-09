import 'package:flutter/material.dart';

class Servicos extends StatefulWidget {
  const Servicos({super.key});

  static const String nomeDaRota = "/servicos";

  @override
  State<Servicos> createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SERVIÇOS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.cyan,
      ),

      body: const Center(
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/detalhe_servicos.png")),
            Text("Consultoria"),
            Text("Cálculo de preços"),
            Text("Acompanhamento de projetos"),
          ],
        ),
      ),
    );
  }
}