import 'package:flutter/material.dart';

class Filtro {
  String doenca = "dengue";
  String estado = "Distrito Federal (Brasília)";
  String geocode = "5300108";
  DateTime dataInicial = DateTime(2010, 1, 1);
  DateTime dataFinal = DateTime.now();

  int semanaInicial() {
    DateTimeRange intervalo = DateTimeRange(
      start: DateTime(dataInicial.year, 1, 1),
      end: dataInicial,
    );
    return (intervalo.duration.inDays / 7).round();
  }

  int semanaFinal() {
    DateTimeRange intervalo = DateTimeRange(
      start: DateTime(dataFinal.year),
      end: dataFinal,
    );
    return (intervalo.duration.inDays / 7).round();
  }

  void confere() {
    if (dataInicial.isAfter(dataFinal)) {
      DateTime temp = dataInicial;
      dataInicial = dataFinal;
      dataFinal = temp;
    }
  }
}
