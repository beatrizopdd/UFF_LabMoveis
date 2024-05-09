import 'package:flutter/material.dart';
import 'ficha.dart';
import 'page2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  late Ficha ficha = Ficha();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NAVEGAÇÃO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Digite seu nome:",
              labelStyle: TextStyle(fontStyle: FontStyle.italic),
            ),
            onChanged: (value) {ficha.nome = value;},
          ),

          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Digite sua idade:",
              labelStyle: TextStyle(fontStyle: FontStyle.italic),
            ),
            onChanged: (value) {ficha.idade = int.parse(value);},
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, Page2.nomeDaRota, arguments: ficha);
            },
            child: const Text("Avançar"),
          )
        ],
      ),
    );
  }
}
