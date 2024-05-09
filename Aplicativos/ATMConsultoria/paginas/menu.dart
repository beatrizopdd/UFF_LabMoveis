import 'package:flutter/material.dart';
import 'empresa.dart';
import 'servicos.dart';
import 'clientes.dart';
import 'contato.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ATM Consultoria", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              const Image(image: AssetImage("assets/images/logo.png")),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, Empresa.nomeDaRota);},
                    child: const Image(
                      image: AssetImage("assets/images/menu_empresa.png"),
                      width: 120,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, Servicos.nomeDaRota);},
                    child: const Image(
                      image: AssetImage("assets/images/menu_servicos.png"),
                      width: 120,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, Clientes.nomeDaRota);},
                    child: const Image(
                      image: AssetImage("assets/images/menu_clientes.png"),
                      width: 120,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, Contato.nomeDaRota);},
                    child: const Image(
                      image: AssetImage("assets/images/menu_contato.png"),
                      width: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
