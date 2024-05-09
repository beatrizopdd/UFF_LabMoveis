import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  int clicks = 0;
  void contaClick(){
    setState(() {
      ++clicks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CONTADOR DE CLICKS",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: Center(
        child: Text(
          "Você clicou $clicks vezes",
          style: TextStyle(fontSize: 35),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: contaClick,
        child: Icon(Icons.ads_click_rounded, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: (clicks % 4),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.deepOrangeAccent,
              icon: Icon(Icons.facebook),
              label: "FACEBOOK",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.photo_camera_outlined),
              label: "INSTAGRAM",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.deepOrangeAccent,
              icon: Icon(Icons.mail_rounded),
              label: "GMAIL",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.currency_exchange_outlined),
              label: "BANCO",
            ),
          ]
      ),
    );
  }

}