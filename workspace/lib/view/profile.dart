import 'package:flutter/material.dart';
import '../controller/DatabaseController.dart';
import '../model/paciente.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Paciente paciente;
  TextEditingController controleNome = TextEditingController();
  TextEditingController controleIdade = TextEditingController();
  TextEditingController controleEmail = TextEditingController();
  TextEditingController controleCpf = TextEditingController();

  Future<Paciente> buildPaciente() async {
    paciente = (await DatabaseController.acessaPacientePorCpf(paciente.cpf))!;
    return paciente;
  }

  void atualizaPaciente() async {
    // Resetando variáveis
    controleNome.text = paciente.nome;
    controleIdade.text = paciente.idade.toString();
    controleEmail.text = paciente.email;
    controleCpf.text = paciente.cpf.toString();

    // Tela
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: const Text("Atualizar paciente"),
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
                enabled: false,
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
              onPressed: () async {
                await DatabaseController.atualizaPaciente({
                  "nome": controleNome.text,
                  "idade": int.parse(controleIdade.text),
                  "email": controleEmail.text,
                  "cpf": int.parse(controleCpf.text),
                });
                Navigator.of(context).pop();
              },
              child: const Text("Atualizar"),
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
    paciente = ModalRoute.of(context)!.settings.arguments as Paciente;
    return Scaffold(
      // Título do App
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "PERFIL",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              atualizaPaciente();
              setState(() {});
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),

      // Corpo
      body: FutureBuilder(
        future: buildPaciente(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Text(paciente.nome),
              Text(paciente.email),
              Text(paciente.cpf.toString()),
              Text(paciente.idade.toString()),
            ],
          );
        },
      ),
    );
  }
}
