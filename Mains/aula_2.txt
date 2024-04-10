import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Aula 2",
      home: Container(
        margin: EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 100),
        decoration: BoxDecoration(color: Colors.yellow[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Texto",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
              ),
            ),
            TextButton(
              child: Container(
                child: Text("Botão de Texto",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                    ),
                ),
              ),
              onPressed: (){},
            ),
            ElevatedButton(
              child: Container(
                child: Text("Botão Elevado",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ),
              onPressed: (){},
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.lightbulb, color: Colors.blueAccent),
              onPressed: (){},
            ),
          ],
        ),
      ),
    ),
  );
}