import 'package:flutter/material.dart';
import 'paginas/menu.dart';
import 'paginas/empresa.dart';
import 'paginas/servicos.dart';
import 'paginas/clientes.dart';
import 'paginas/contato.dart';

void main() {
  runApp(
    MaterialApp(
      title: "ATM Consultoria",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const Menu(),
      initialRoute: "/",
      routes: {
        Empresa.nomeDaRota: (context) => const Empresa(),
        Servicos.nomeDaRota: (context) => const Servicos(),
        Clientes.nomeDaRota: (context) => const Clientes(),
        Contato.nomeDaRota: (context) => const Contato(),
      },
    ),
  );
}