import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  static const String nomeDaRota = "/clientes";

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "NOSSOS CLIENTES", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),

      body: const Center(
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/detalhe_clientes.png")),
            Image(image: AssetImage("assets/images/cliente1.png")),
            Text("Empresa de software"),
            Image(image: AssetImage("assets/images/cliente2.png")),
            Text("Empresa de auditoria"),
          ],
        ),
      ),
    );
  }
}