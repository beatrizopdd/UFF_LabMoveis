import 'package:flutter/material.dart';
import 'package:projeto_flutter/paginas/configuracao.dart';

class Menu extends StatefulWidget {

  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {

  Configuracao configuracao = Configuracao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "JOGO DA VELHA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            // Input Apelido
            TextField(
              decoration: const InputDecoration(
                label: Text(
                  "Digite seu apelido:",
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
              maxLength: 15,
              onChanged: (texto){configuracao.apelido = texto;},
            ),

            const SizedBox(height: 20),

            // Input Tabuleiro
            const Text(
              "Escolha seu tabuleiro:",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),

            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: 3,
                    groupValue: configuracao.tabuleiro,
                    title: const Text("3x3"),
                    onChanged: (value){
                      configuracao.tabuleiro = value!;
                      setState(() {});
                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    value: 4,
                    groupValue: configuracao.tabuleiro,
                    title: const Text("4x4"),
                    onChanged: (value){
                      configuracao.tabuleiro = value!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Input Marcadores
            const Text(
              "Escolha seu marcador:",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),

            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: Icons.close,
                    groupValue: configuracao.marcadorUsuario,
                    title: const Icon(Icons.close_outlined, size: 40, color: Colors.lightGreen),
                    onChanged: (value){
                      configuracao.marcadores(value!, Icons.circle_outlined);
                      setState(() {});
                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    value: Icons.circle_outlined,
                    groupValue: configuracao.marcadorUsuario,
                    title: const Icon(Icons.circle_sharp, size: 34, color: Colors.lightGreen),
                    onChanged: (value){
                      configuracao.marcadores(value!, Icons.close);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Button Iniciar Jogo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade900)),
                  onPressed: (){
                    String nomeDaRota = "/tabuleiro${configuracao.tabuleiro}";
                    Navigator.pushNamed(context, nomeDaRota, arguments: configuracao);
                  },
                  child: const Text(
                    "INICIAR JOGO",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}