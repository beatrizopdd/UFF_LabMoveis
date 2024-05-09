import 'package:flutter/material.dart';

class Configuracao {

  // ATRIBUTOS
  String _apelido = "Usuário";
  int _tabuleiro = 3;
  IconData _marcadorUsuario = Icons.close;
  IconData _marcadorRobo = Icons.circle_outlined;

  // GETTERS E SETTERS
  String get apelido => _apelido;
  set apelido(String novo) {_apelido = novo;}

  int get tabuleiro => _tabuleiro;
  set tabuleiro(int novo) {_tabuleiro = novo;}

  IconData get marcadorUsuario => _marcadorUsuario;
  IconData get marcadorRobo => _marcadorRobo;
  void marcadores(IconData usuario, IconData robo) {
    _marcadorUsuario = usuario;
    _marcadorRobo = robo;
  }

}