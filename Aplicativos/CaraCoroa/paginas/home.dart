import 'package:flutter/material.dart';
import 'dart:math';
import 'resultado.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        centerTitle: true,
        title: const Text(
          "CARA OU COROA",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/images/logo.jpeg")),

            const SizedBox(height: 35),

            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                int moeda = Random().nextInt(100) % 2;
                Navigator.pushNamed(context, Resultado.nomeDaRota, arguments: moeda);
              },
              child: const Text("Jogar"),
            )
          ],
        ),
      ),
    );
  }
}