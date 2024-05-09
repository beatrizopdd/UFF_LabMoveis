import 'package:flutter/material.dart';
import 'ficha.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});

  static const String nomeDaRota = "/pagina3";

  late Ficha ficha;
  Page3.ficha(this.ficha);

  @override
  State<Page3> createState() => _PaginaState();
}

class _PaginaState extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NAVEGAÇÃO: Página 3", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Idade: ${widget.ficha.idade}\nAno de nascimento: ${widget.ficha.nascimento}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                backgroundColor: Colors.amber.shade100,
              ),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Voltar"),
            )
          ],
        ),
      ),
    );
  }
}