import 'package:flutter/material.dart';
import 'paginas/home.dart';
import 'paginas/resultado_intervalo.dart';
import 'paginas/resultado_semana.dart';

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
        ResultadoIntervalo.nomeDaRota: (context) => const ResultadoIntervalo(),
        ResultadoSemana.nomeDaRota: (context) => const ResultadoSemana(),
      },
    )
  );
}