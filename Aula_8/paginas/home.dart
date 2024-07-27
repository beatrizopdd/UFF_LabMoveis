import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Salvando, Recuperando e Removendo preferências
  String nomeDigitado = "";
  String texto = "";

  void salvar() async {
    final preferencias = await SharedPreferences.getInstance();
    await preferencias.setString("nomeSalvo", nomeDigitado);
  }

  void recuperar() async {
    final preferencias = await SharedPreferences.getInstance();
    texto = preferencias.getString("nomeSalvo")!;
    setState(() {});
  }

  void remover() async {
    final preferencias = await SharedPreferences.getInstance();
    preferencias.remove("nomeSalvo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Shared Preferences",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Corpo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Espaço
            const SizedBox(height: 10),

            // Título
            Text(
              "Shared Preferences de $texto",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            // Espaço
            const SizedBox(height: 25),

            // Campo do nome
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Nome",
                prefixIcon: Icon(Icons.person, size: 20),
              ),
              onChanged: (value) {
                nomeDigitado = value;
              },
            ),

            // Espaço
            const SizedBox(height: 25),

            // Botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: salvar,
                  child: const Text("Salvar"),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: recuperar,
                  child: const Text("Recuperar"),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: remover,
                  child: const Text("Remover"),
                )
              ],
            ),

            // Espaço
            const SizedBox(height: 35),

            // Próxima página
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/lista_de_tarefas");
              },
              child: const Text("Avançar"),
            )
          ],
        ),
      ),
    );
  }
}
