import 'package:flutter/material.dart';
import 'package:projeto_flutter/modelos/comentario.dart';

class Tile extends StatefulWidget {
  Tile({super.key});

  static const String nomeDaRota = "/tile";

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    final comentario = ModalRoute.of(context)!.settings.arguments as Comentario;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "COMENTÁRIO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(5),

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Text(
                "${comentario.indice} - ${comentario.titulo}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "de ${comentario.email}",
                style: const TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                comentario.corpo,
                style: const TextStyle(fontSize: 15),
              ),
            ]
        ),
      ),
    );
  }
}