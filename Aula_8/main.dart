import 'package:flutter/material.dart';
import 'paginas/home.dart';
import 'paginas/tarefas.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Lista de Tarefas",
      home: const Home(),
      routes: {
        "/lista_de_tarefas": (context) => const Tarefas(),
      },
    )
  );
}