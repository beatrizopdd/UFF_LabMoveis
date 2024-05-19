import 'package:flutter/material.dart';
import 'paginas/home.dart';
import 'paginas/resultado.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Alerta Dengue",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, primary: Colors.red),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        Resultado.nomeDaRota: (context) => const Resultado()
      },
    )
  );
}