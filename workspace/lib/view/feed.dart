import 'package:flutter/material.dart';
import '../controller/DatabaseController.dart';
import '../model/paciente.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  TextEditingController controleNome = TextEditingController();
  TextEditingController controleIdade = TextEditingController();
  TextEditingController controleEmail = TextEditingController();
  TextEditingController controleCpf = TextEditingController();

  Future<dynamic> carregaPacientes() async {
    return DatabaseController.carregaPacientes();
  }

  void cadastraPaciente() {
    // Resetando variáveis
    controleNome.text = "";
    controleIdade.text = "";
    controleEmail.text = "";
    controleCpf.text = "";

    // Tela
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: const Text("Cadastrar Paciente"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: controleNome,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                controller: controleIdade,
                decoration: const InputDecoration(
                  labelText: "Idade",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: controleEmail,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                controller: controleCpf,
                decoration: const InputDecoration(
                  labelText: "Cpf",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                DatabaseController.salvaPaciente({
                  "nome": controleNome.text,
                  "idade": int.parse(controleIdade.text),
                  "email": controleEmail.text,
                  "cpf": int.parse(controleCpf.text),
                });
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Título do App
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "PACIENTES",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),

      // Botão flutuante
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: const CircleBorder(),
        onPressed: () {
          cadastraPaciente();
        },
        child: const Icon(Icons.add, size: 30, color: Colors.black),
      ),

      // Corpo
      body: Expanded(
        child: FutureBuilder(
          future: carregaPacientes(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Icon(Icons.restore_page_outlined));
              case (ConnectionState.waiting || ConnectionState.active):
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Icon(Icons.signal_cellular_0_bar));
                } else {
                  List<dynamic> listaPacientes = snapshot.data;
                  return ListView.builder(
                    itemCount: listaPacientes.length,
                    itemBuilder: (context, index) {
                      Paciente paciente = listaPacientes[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            "/profile", 
                            arguments: paciente,
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent.shade100,
                          child: Text(
                            paciente.nome.characters.first.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        title: Text(paciente.nome),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
