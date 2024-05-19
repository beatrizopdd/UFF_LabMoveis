import 'package:flutter/material.dart';
import 'paginas/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Web Service",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    )
  );
}