import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modelos/filtro.dart';
import 'resultado.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  Filtro filtro = Filtro();

  List<String> estado = ["Acre (Rio Branco)", "Alagoas (Maceió)", "Amapá (Macapá)", "Amazonas (Manaus)", "Bahia (Salvador)", "Ceará (Fortaleza)", "Distrito Federal (Brasília)", "Espírito Santo (Vitória)", "Goiás (Goiânia)", "Maranhão (São Luís)", "Mato Grosso (Cuiabá)", "Mato Grosso do Sul (Campo Grande)", "Minas Gerais (Belo Horizonte)", "Pará (Belém)", "Paraíba (João Pessoa)", "Paraná (Curitiba)", "Pernambuco (Recife)", "Piauí (Teresina)", "Rio de Janeiro (Rio de Janeiro)", "Rio Grande do Norte (Natal)", "Rio Grande do Sul (Porto Alegre)", "Rondônia (Porto Velho)", "Roraima (Boa Vista)", "Santa Catarina (Florianópolis)", "São Paulo (São Paulo)", "Sergipe (Aracaju)", "Tocantins (Palmas)"];
  List<String> geocode = ["1200401", "2700300", "1600303", "1302603", "2927408", "2304400", "5300108", "3205309", "5208707", "2111300", "5103403", "5002704", "3106200", "1501402", "2507507", "4106902", "2611606", "2211001", "3304557", "2408102", "4314902", "1100205", "1400100", "4205407", "3550308", "2800308", "1721000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "ALERTA DENGUE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SELEÇÃO DA DOENÇA
            const Text(
              "Doença:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  value: "dengue",
                  title: const Text("Dengue"),
                  groupValue: filtro.doenca,
                  onChanged: (value) {
                    filtro.doenca = value!;
                    setState(() {});
                  },
                ),

                RadioListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  value: "chikungunya",
                  title: const Text("Chikungunya"),
                  groupValue: filtro.doenca,
                  onChanged: (value) {
                    filtro.doenca = value!;
                    setState(() {});
                  },
                ),

                RadioListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  value: "zika",
                  title: const Text("Zika"),
                  groupValue: filtro.doenca,
                  onChanged: (value) {
                    filtro.doenca = value!;
                    setState(() {});
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            // SELEÇÃO DA CAPITAL
            const Text(
              "Capital:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DropdownMenu(
              label: const Text("Estado (capital)", style: TextStyle(fontStyle: FontStyle.italic)),
              width: 383,
              onSelected: (value) {
                if (value != null) {
                  filtro.estado = estado[value];
                  filtro.geocode = geocode[value];
                }
              },
              dropdownMenuEntries: List.generate(
                27,
                (index) => DropdownMenuEntry(value: index, label: estado[index]),
              ),
            ),

            const SizedBox(height: 15),

            // SELEÇÃO DO INTERVALO
            const Text(
              "Intervalo :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),
            // colocar drop down menus
            Row(
              children: [
                DropdownMenu(
                  label: const Text("mês", style: TextStyle(fontStyle: FontStyle.italic)),
                  width: 50,
                  onSelected: (value) {
                    if (value != null) {
                      filtro.dataInicial.month = value;
                    }
                  },
                  dropdownMenuEntries: List.generate(
                    27,
                        (index) => DropdownMenuEntry(value: index, label: estado[index]),
                  ),
                ),
              ],
            ),
            InputDatePickerFormField(
              acceptEmptyDate: false,
              fieldLabelText: "Data Inicial",
              fieldHintText: "mm/dd/yyyy desde 01/01/2010",
              firstDate: DateTime(2010, 1, 1),
              lastDate: DateTime.now(),
              onDateSubmitted: (value) {
                filtro.dataInicial = value;
                setState(() {});
              },
            ),

            const SizedBox(height: 10),

            InputDatePickerFormField(
              fieldLabelText: "Data Final",
              fieldHintText: "mm/dd/yyyy desde 01/01/2010",
              firstDate: DateTime(2010, 1, 1),
              lastDate: DateTime.now(),
              onDateSubmitted: (value) {
                filtro.dataFinal = value;
                setState(() {});
              },
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text("Buscar", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, Resultado.nomeDaRota, arguments: filtro);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}