import 'package:flutter/material.dart';
import 'ficha.dart';
import 'page3.dart';

class Page2 extends StatefulWidget {
  Page2({super.key});

  static const String nomeDaRota = "/pagina2";

  @override
  State<Page2> createState() => _PaginaState();
}

class _PaginaState extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final ficha = ModalRoute.of(context)!.settings.arguments as Ficha;

    return Scaffold(
      appBar: AppBar(
          title: const Text("NAVEGAÇÃO: Página 2", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Nome: ${ficha.nome}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  backgroundColor: Colors.amber.shade100,
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Voltar"),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, Page3.nomeDaRota, arguments: ficha);
                  },
                  child: const Text("Avançar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}