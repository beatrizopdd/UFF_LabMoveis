import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projeto_flutter/modelos/comentario.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  String status = "Aguardando instrução...";
  String pagina = "https://jsonplaceholder.typicode.com/comments";

  // 201 = OK e Criado;
  // 200 = OK;
  void post() async {
    String link = pagina;
    var resposta = await http.post(
      Uri.parse(link),
      headers: {'Content-type': 'application/json;charset=UTF-8'},
      body: json.encode({
        "postId": "post relacionado a esse comentário",
        "id": "próximo indice", //o site tem 500 comentários
        "name": "titulo",
        "email": "email",
        "body": "corpo",
      }),
    );
    // para visualização dos efeitos dessa função
    status = "Post status: ${resposta.statusCode.toString()}\nPost body: ${resposta.body}";
    setState(() {});
  }

  void patch() async {
    int item = 1;
    String link = "$pagina/$item";
    var resposta = await http.patch(
      Uri.parse(link),
      headers: {'Content-type': 'application/json;charset=UTF-8'},
      body: json.encode({
        "name": "correção",
      }),
    );
    // para visualização dos efeitos dessa função
    status = "Patch status: ${resposta.statusCode.toString()}\nPatch body: ${resposta.body}";
    setState(() {});
  }

  void delete() async {
    int item = 1;
    String link = "$pagina/$item";
    var resposta = await http.delete(Uri.parse(link));
    // para visualização dos efeitos dessa função
    status = "Delete status: ${resposta.statusCode.toString()}\nDelete body: ${resposta.body}";
    setState(() {});
  }

  Future<List<Comentario>> getPosts() async {
    String link = pagina;
    http.Response resposta = await http.get(Uri.parse(link));
    var dados  = json.decode(resposta.body);

    List<Comentario> comentarios = [];
    for (var dado in dados) {
      comentarios.add(Comentario.conversor(dado));
    }

    return comentarios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          "REQUISIÇÃO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status, style: const TextStyle(fontSize: 20), ),

            const SizedBox(height: 10),

            // OPÇÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(ContinuousRectangleBorder())),
                  onPressed: post,
                  child: const Text("Salvar"),
                ),

                ElevatedButton(
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(ContinuousRectangleBorder())),
                  onPressed: patch,
                  child: const Text("Atualizar"),
                ),

                ElevatedButton(
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(ContinuousRectangleBorder())),
                  onPressed: delete,
                  child: const Text("Deletar"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(width: 400, height: 1, child: Container(color: Colors.black)),

            // POSTAGENS
            FutureBuilder(
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
                      List<Comentario>? comentarios = snapshot.data;
                      return Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: comentarios!.length,
                          itemBuilder: (context, index) {
                            Comentario comentario = comentarios[index];
                            return ListTile(
                              title: Text("${comentario.indice} - ${comentario.titulo}"),
                              onTap: () {
                               // Navigator.pushNamed(context, Tile.nomeDaRota, arguments: comentario);
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
      ),
    );
  }
}