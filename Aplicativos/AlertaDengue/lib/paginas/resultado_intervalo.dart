import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'resultado_semana.dart';
import 'modelos/filtro.dart';
import 'modelos/semana.dart';

class ResultadoIntervalo extends StatefulWidget {
  const ResultadoIntervalo({super.key});

  static const String nomeDaRota = "/intervalo";

  @override
  State<ResultadoIntervalo> createState() => IntervaloState();
}

class IntervaloState extends State<ResultadoIntervalo> {

  late Filtro filtro;

  Future<List<Semana>> getPosts() async {
    String link = "https://info.dengue.mat.br/api/alertcity/?geocode=${filtro.geocode}&disease=${filtro.doenca}&format=json&ew_start=${filtro.semanaInicial()}&ey_start=${filtro.dataInicial.year}&ew_end=${filtro.semanaFinal()}&ey_end=${filtro.dataFinal.year}";
    http.Response resposta = await http.get(Uri.parse(link));
    var dados  = json.decode(resposta.body);

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
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "SEMANAS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_pin, color: Colors.red),
                    Text(
                      filtro.estado,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                  
                const SizedBox(height: 5),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.red),
                    Text(
                      "${filtro.dataInicial.month}/${filtro.dataInicial.year}"
                      "- ${filtro.dataFinal.month}/${filtro.dataFinal.year}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              
                const SizedBox(height: 10),
              ]
            ),
          ),

          FutureBuilder(
            future: getPosts(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Icon(Icons.restore_page_outlined));
                case (ConnectionState.waiting || ConnectionState.active):
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const Center(child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded));
                  }
                  else {
                    List<Semana>? semanas = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: semanas!.length,
                        itemBuilder: (context, index) {
                          Semana semana = semanas[index];
                          return ListTile(
                            leading: const Icon(Icons.insert_chart_outlined_sharp, color: Colors.black, size: 20),
                            title: Text("Semana ${index+1}"),
                            shape: Border.all(color: Colors.black26),
                            onTap: () {
                              Navigator.pushNamed(context, ResultadoSemana.nomeDaRota, arguments: semana);
                            },
                          );
                        },
                      ),
                    );
                  }
              }
            }
          ),
        ],
      ),
    );
  }
}
