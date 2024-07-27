import 'package:flutter/material.dart';
import '../model/paciente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseController {
  static List<Paciente> _toList(List pacientesMap) {
    List<Paciente> pacientesList = [];
    for (var paciente in pacientesMap) {
      pacientesList.add(Paciente.toClass(paciente));
    }
    return pacientesList;
  }

  static Future<Paciente> acessaPacientePorCpf(int cpf) async {
    Database bancoDeDados = await _carregaDatabase();
    String comando = """
      SELECT *
      FROM pacientes
      WHERE cpf = ?
    """;

    var paciente = await bancoDeDados.rawQuery(
      comando,
      [cpf],
    );
    return Paciente.toClass(paciente.first);
  }

  static Future<int> salvaPaciente(Map<String, dynamic> paciente) async {
    Database bancoDeDados = await _carregaDatabase();
    return await bancoDeDados.insert(
      "pacientes",
      paciente,
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static atualizaPaciente(
      Map<String, dynamic> paciente) async {
    Database bancoDeDados = await _carregaDatabase();
    await bancoDeDados.update(
      "pacientes",
      paciente,
      where: "cpf = ?",
      whereArgs: [paciente["cpf"]],
    );
  }

  // deletaPaciente

  static _carregaDatabase() async {
    String diretorio = await getDatabasesPath();
    String caminho = path.join(diretorio, "bancoDeDados.db");

    Database bancoDeDados = await openDatabase(
      caminho,
      version: 2,
      onCreate: (db, version) async {
        String comando = """
          CREATE TABLE pacientes(
            cpf INTEGER PRIMARY KEY,
            nome VARCHAR,
            idade INTEGER,
            email VARCHAR
          );
        """;

        await db.execute(comando);
      },
    );
    return bancoDeDados;
  }

  static Future<List<Paciente>> carregaPacientes() async {
    Database bancoDeDados = await _carregaDatabase();
    String comando = """
      SELECT *
      FROM pacientes
      ORDER BY nome ASC;
    """;
    List pacientes = await bancoDeDados.rawQuery(comando);
    debugPrint("BANCODEDADOS: ${pacientes.toString()}");
    return _toList(pacientes);
  }
}
