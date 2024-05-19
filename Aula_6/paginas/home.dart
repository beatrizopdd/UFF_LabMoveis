import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  late int cep = 12345678;
  late String endereco = "Logradouro: \nBairro: \nCidade: ";

  void getEndereco() async {
    String link = "https://viacep.com.br/ws/$cep/json/";
    http.Response resposta = await http.get(Uri.parse(link));
    Map<String, dynamic> dados  = json.decode(resposta.body);
    endereco = "Logradouro: ${dados["logradouro"]}\nBairro: ${dados["bairro"]}\nCidade: ${dados["localidade"]} (${dados["uf"]})";
    setState(() {});
  }

  late String sigla = "";
  late String pais = "País: ";

  Future<List<dynamic>> getPais() async{
    if (sigla.isNotEmpty) {
      String link = "https://servicodados.ibge.gov.br/api/v1/paises/$sigla";
      final resposta = await http.get(Uri.parse(link));
      return json.decode(resposta.body);
    }
    return [{"nome": {"abreviado": ""}}];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "WEB SERVICES",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BUSCAR CEP
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Digite um CEP sem traços e pontos:"),
              onChanged: (value) {cep = int.parse(value);},
            ),

            ElevatedButton(
              onPressed: getEndereco,
              child: const Text("Buscar CEP"),
            ),

            const SizedBox(height: 15),

            Text(
              "$endereco",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 50),

            // BUSCAR PAÍS
            TextField(
              maxLength: 2,
              decoration: const InputDecoration(labelText: "Digite uma sigla de país:"),
              onChanged: (value) {sigla = value;},
            ),

            ElevatedButton(
              onPressed: () {
                getEndereco;
                setState(() {});
              },
              child: const Text("Buscar país"),
            ),

            const SizedBox(height: 20),

            FutureBuilder(
              future: getPais(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  pais = "País: ${snapshot.data![0]["nome"]["abreviado"]}";
                } else if (snapshot.data!.isEmpty) {
                  pais = "País: não encontrado";
                } else {
                  return const CircularProgressIndicator();
                }
                return Text(pais, style: const TextStyle(fontSize: 16));
              }
            ),
          ],
        ),
      ),
    );
  }
}