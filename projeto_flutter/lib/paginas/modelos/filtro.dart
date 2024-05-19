import 'package:flutter/material.dart';

class Filtro {
  String doenca = "dengue";
  String estado = "Rio de Janeiro (Rio de Janeiro)";
  String geocode = "3304557";
  DateTime dataInicial = DateTime(2010, 1, 1);
  DateTime dataFinal = DateTime.now();

  int semanaInicial() {
    DateTimeRange intervalo = DateTimeRange(start: DateTime(dataInicial.year, 1, 1), end: dataInicial);
    return (intervalo.duration.inDays / 7).round();
  }

  int semanaFinal() {
    DateTimeRange intervalo = DateTimeRange(start: DateTime(dataFinal.year, 1, 1), end: dataFinal);
    return (intervalo.duration.inDays / 7).round();
  }
}