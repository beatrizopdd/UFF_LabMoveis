import 'package:flutter/material.dart';
import 'paginas/menu.dart';
import 'paginas/tabuleiro3.dart';
import 'paginas/tabuleiro4.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Jogo da Velha",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade900,
          primary: Colors.blue.shade900,
        ),
        useMaterial3: true,
      ),

      home: const Menu(),
      initialRoute: "/",
      routes: {
        Tabuleiro3.nomeDaRota: (context) => Tabuleiro3(),
        Tabuleiro4.nomeDaRota: (context) => Tabuleiro4(),
      },
    )
  );
}