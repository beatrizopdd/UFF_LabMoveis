import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modelos/filtro.dart';
import 'modelos/semana.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  static const String nomeDaRota = "/resultado";

  @override
  State<Resultado> createState() => ResultadoState();
}

class ResultadoState extends State<Resultado> {

  late Filtro filtro;

  Future<List<Semana>> getPosts() async {
    String link = "https://info.dengue.mat.br/api/alertcity/?geocode=${filtro.geocode}&disease=${filtro.doenca}&format=json&ew_start=${filtro.semanaInicial()}&ey_start=${filtro.dataInicial.year}&ew_end=${filtro.semanaFinal()}&ey_end=${filtro.dataFinal.year}";
    http.Response resposta = await http.get(Uri.parse(link));
    var dados  = json.decode(resposta.body);
    debugPrint(filtro.dataInicial.toString());
    debugPrint(filtro.dataFinal.toString());
    List<Semana> semanas = [];
    for (var dado in dados) {
      semanas.add(Semana.conversor(dado));
    }
    return semanas;
  }

  @override
  Widget build(BuildContext context) {

    filtro = ModalRoute.of(context)!.settings.arguments as Filtro;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "RESULTADOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder(
          future: getPosts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded));
              case (ConnectionState.waiting || ConnectionState.active):
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(child: Icon(Icons.restore_page_outlined));
                }
                else {
                  List<Semana>? semanas = snapshot.data;
                  return Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: semanas!.length,
                      itemBuilder: (context, index) {
                        Semana semana = semanas[index];
                        return ListTile(
                          title: Text("Semana $index"),
                        );
                      },
                    ),
                  );
                }
            }
          }
      ),
    );
  }
}