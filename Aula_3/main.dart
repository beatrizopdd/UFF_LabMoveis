import 'package:flutter/material.dart';
import 'paginas/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Aula 3",
      home: Home(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    )
  );
}