import 'dart:ffi';

import 'package:flutter/material.dart';

import 'modelos/semana.dart';

class ResultadoSemana extends StatefulWidget {
  const ResultadoSemana({super.key});

  static const String nomeDaRota = "/semana";

  @override
  State<ResultadoSemana> createState() => SemanaState();
}

class SemanaState extends State<ResultadoSemana> {

  @override
  Widget build(BuildContext context) {

    Semana semana = ModalRoute.of(context)!.settings.arguments as Semana;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "RESULTADO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CASOS ESTIMADOS
            Text(
              "${semana.casosEstimados} casos previstos",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // CASOS NOTIFICADOS
            Text(
              "${semana.casosNotificados} casos notificados",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // NÍVEL
            Text(
              "Nível ${semana.nivel}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            // TEMPERATURAS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thermostat_sharp, color: Colors.blueAccent),

                const SizedBox(width: 5),

                Text(semana.tempMin.toString(), style: const TextStyle(fontSize: 18)),

                const SizedBox(width: 15),

                const Icon(Icons.thermostat_outlined, color: Colors.redAccent),

                const SizedBox(width: 5),

                Text(semana.tempMax.toString(), style: const TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }

}