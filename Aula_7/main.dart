import 'package:flutter/material.dart';
import 'paginas/home.dart';
import 'paginas/tile.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Web Service - parte 2",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade900,
          primary: Colors.blue.shade900,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        Tile.nomeDaRota: (context) => Tile(),
      },
    )
  );
}