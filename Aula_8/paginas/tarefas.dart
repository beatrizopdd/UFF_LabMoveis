import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});
  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  // Salvando, Recuperando e Removendo objetos
  List<dynamic> tarefaLista = [];
  String tituloNovo = "";

  Future<File> getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    String filePath = "${diretorio.path}/task.json";
    return File(filePath);
  }

  Future<String> readFile() async {
    final arquivo = await getFile();
    return arquivo.readAsString();
  }

  void salvaArquivo() async {
    final arquivo = await getFile();
    arquivo.writeAsString(jsonEncode(tarefaLista));
  }

  void salvaTarefa() {
    Map<String, dynamic> tarefa = Map();
    tarefa["title"] = tituloNovo;
    tarefa["done"] = false;

    tarefaLista.add(tarefa);
    setState(() {});
    salvaArquivo();
  }

  void atualizaTarefa(int index) {
    setState(() {
      tarefaLista[index]["title"] = tituloNovo;
    });
    salvaArquivo();
  }

  @override
  void initState() {
    super.initState();
    readFile().then((dados) {
      tarefaLista = jsonDecode(dados);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Path Provider",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Botão flutuante
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          tituloNovo = "";
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Adicionar Tarefa"),
                content: TextField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Tarefa:"),
                  onChanged: (value) {
                    tituloNovo = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      salvaTarefa();
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
        },
        child: const Icon(Icons.add),
      ),

      // Corpo
      body: Expanded(
        child: ListView.builder(
          itemCount: tarefaLista.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(DateTime.now().microsecondsSinceEpoch.toString()),

              // Aparência
              background: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Icon(Icons.edit, color: Colors.white)],
                ),
              ),

              // Aparência secundária
              secondaryBackground: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.delete, color: Colors.white)],
                ),
              ),

              // Ações
              onDismissed: (direction) {
                //Atualizar Tarefa
                if (direction == DismissDirection.startToEnd) {
                  tituloNovo = tarefaLista[index]["title"];

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Atualizar Tarefa"),
                        content: TextField(
                          keyboardType: TextInputType.text,
                          decoration:
                              const InputDecoration(labelText: "Tarefa:"),
                          onChanged: (value) {
                            tituloNovo = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Salvar"),
                            onPressed: () {
                              atualizaTarefa(index);
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text("Cancelar"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );

                  // Remover Tarefa
                } else if (direction == DismissDirection.endToStart) {
                  var tarefaRemovida = tarefaLista[index];
                  tarefaLista.removeAt(index);
                  salvaArquivo();

                  final snackBar = SnackBar(
                    content: const Text("Tarefa excluída!"),
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: "Desfazer",
                      onPressed: () {
                        setState(() {
                          tarefaLista.insert(index, tarefaRemovida);
                        });
                        salvaArquivo();
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },

              child: CheckboxListTile(
                title: Text(tarefaLista[index]["title"]),
                value: tarefaLista[index]["done"],
                onChanged: (bool? status) {
                  tarefaLista[index]["done"] = status;
                  setState(() {});
                  salvaArquivo();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
