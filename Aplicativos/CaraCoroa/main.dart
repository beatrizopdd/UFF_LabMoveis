import 'package:flutter/material.dart';
import '../../projeto_flutter/lib/paginas/home.dart';
import '../../projeto_flutter/lib/paginas/resultado.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Web Service",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          primary: Colors.yellow.shade600,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        Resultado.nomeDaRota: (context) => const Resultado(),
      },
    )
  );
}