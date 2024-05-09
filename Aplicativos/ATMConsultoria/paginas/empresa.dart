import 'package:flutter/material.dart';

class Empresa extends StatefulWidget {
  const Empresa({super.key});

  static const String nomeDaRota = "/empresa";

  @override
  State<Empresa> createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SOBRE A EMPRESA", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange.shade900,
      ),

      body: const Center(
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/detalhe_empresa.png")),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi venenatis non purus nec dictum. Aenean ultrices sodales consectetur. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras lacinia, dui sed aliquet porttitor, purus eros ullamcorper tortor, ut sollicitudin turpis justo ac lorem. Aliquam erat volutpat. Sed quis condimentum nunc. Sed feugiat, nibh a tempor finibus, justo tortor cursus orci, et suscipit elit urna in mi."
            ),
          ],
        ),
      ),
    );
  }
}