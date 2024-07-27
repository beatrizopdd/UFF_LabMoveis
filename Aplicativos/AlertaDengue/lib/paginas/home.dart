import 'package:flutter/material.dart';
import 'modelos/filtro.dart';
import 'resultado_intervalo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  Filtro filtro = Filtro();

  List<String> estado = [
    "Acre (Rio Branco)",
    "Alagoas (Maceió)",
    "Amapá (Macapá)",
    "Amazonas (Manaus)",
    "Bahia (Salvador)",
    "Ceará (Fortaleza)",
    "Distrito Federal (Brasília)",
    "Espírito Santo (Vitória)",
    "Goiás (Goiânia)",
    "Maranhão (São Luís)",
    "Mato Grosso (Cuiabá)",
    "Mato Grosso do Sul (Campo Grande)",
    "Minas Gerais (Belo Horizonte)",
    "Pará (Belém)",
    "Paraíba (João Pessoa)",
    "Paraná (Curitiba)",
    "Pernambuco (Recife)",
    "Piauí (Teresina)",
    "Rio de Janeiro (Rio de Janeiro)",
    "Rio Grande do Norte (Natal)",
    "Rio Grande do Sul (Porto Alegre)",
    "Rondônia (Porto Velho)",
    "Roraima (Boa Vista)",
    "Santa Catarina (Florianópolis)",
    "São Paulo (São Paulo)",
    "Sergipe (Aracaju)",
    "Tocantins (Palmas)"
  ];
  List<String> geocode = [
    "1200401",
    "2700300",
    "1600303",
    "1302603",
    "2927408",
    "2304400",
    "5300108",
    "3205309",
    "5208707",
    "2111300",
    "5103403",
    "5002704",
    "3106200",
    "1501402",
    "2507507",
    "4106902",
    "2611606",
    "2211001",
    "3304557",
    "2408102",
    "4314902",
    "1100205",
    "1400100",
    "4205407",
    "3550308",
    "2800308",
    "1721000"
  ];
  List<int> intervalo = [1, 2010, 1, 2024];

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
            const SizedBox(height: 10),

            // SELEÇÃO DA DOENÇA
            const Text(
              "Doença:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            DropdownMenu(
              label: const Text("Estado (capital)",
                  style: TextStyle(fontStyle: FontStyle.italic)),
              width: 383,
              onSelected: (value) {
                if (value != null) {
                  filtro.estado = estado[value];
                  filtro.geocode = geocode[value];
                }
              },
              dropdownMenuEntries: List.generate(
                27,
                (index) =>
                    DropdownMenuEntry(value: index, label: estado[index]),
              ),
            ),

            const SizedBox(height: 35),

            // SELEÇÃO DO INTERVALO
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Data inicial:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                DropdownMenu(
                  label: const Text("mês",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  width: 110,
                  onSelected: (value) {
                    intervalo[0] = value!;
                  },
                  dropdownMenuEntries: List.generate(
                    12,
                    (index) => DropdownMenuEntry(
                        value: (index + 1), label: ((index + 1).toString())),
                  ),
                ),
                const SizedBox(width: 20),
                DropdownMenu(
                  label: const Text("ano",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  width: 105,
                  onSelected: (value) {
                    intervalo[1] = value!;
                  },
                  dropdownMenuEntries: List.generate(
                    15,
                    (index) => DropdownMenuEntry(
                        value: (index + 2010),
                        label: ((index + 2010).toString())),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Data final:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 32),
                DropdownMenu(
                  label: const Text("mês",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  width: 110,
                  onSelected: (value) {
                    intervalo[2] = value!;
                  },
                  dropdownMenuEntries: List.generate(
                    12,
                    (index) => DropdownMenuEntry(
                        value: (index + 1), label: ((index + 1).toString())),
                  ),
                ),
                const SizedBox(width: 20),
                DropdownMenu(
                  label: const Text("ano",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  width: 105,
                  onSelected: (value) {
                    intervalo[3] = value!;
                  },
                  dropdownMenuEntries: List.generate(
                    15,
                    (index) => DropdownMenuEntry(
                        value: (index + 2010),
                        label: ((index + 2010).toString())),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.red.shade800)),
                child:
                    const Text("Buscar", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  filtro.dataInicial = DateTime(intervalo[1], intervalo[0], 1);
                  filtro.dataFinal = DateTime(intervalo[3], intervalo[2], 1);
                  filtro.confere();
                  Navigator.pushNamed(context, ResultadoIntervalo.nomeDaRota,
                      arguments: filtro);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
