import 'package:flutter/material.dart';
import 'paginas/ficha.dart';
import 'paginas/home.dart';
import 'paginas/page2.dart';
import 'paginas/page3.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Aula 5",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade900,
          primary: Colors.blue.shade900,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
      initialRoute: "/",
      routes: {
        Page2.nomeDaRota: (context) => Page2(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Page3.nomeDaRota) {
          final args = settings.arguments as Ficha;
          return MaterialPageRoute(builder: (context) => Page3.ficha(args));
        }
      },
    ),
  );
}