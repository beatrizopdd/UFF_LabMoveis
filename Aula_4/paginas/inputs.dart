import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => Aparencia();
}

class Aparencia extends State<Inputs> {

  String pedido = "Pedido vazio";
  List<String> acompanhamentos = [];

  //TextField
  String valorTextField = "Anônimo";

  // Checkbox
  List<bool> valorCheckbox = [false, false];

  // Radio
  String valorRadio = "Vegano";

  // Switch
  bool valorSwitch = false;

  // Slider
  double valorSlider = 3;
  List<Color> corSlider = [
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.deepPurpleAccent,
    Colors.blueAccent,
    Colors.lightGreenAccent,
  ];

  void atualizaPedido(){
    setState(() {
      String acompanhamento = "nada para acompanhar";
      if (acompanhamentos.isNotEmpty)
        acompanhamento = acompanhamentos.join(", ");
      pedido = "$valorRadio e $acompanhamento para $valorTextField";
    });
  }

  void salvar(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "ENTRADA DE DADOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              decoration: const InputDecoration(
                label: Text("Nome"),
                labelStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
              ),
              maxLength: 15,
              onChanged: (texto) {
                valorTextField = texto;
                atualizaPedido();
              },
            ),

            ElevatedButton(
              onPressed: salvar,
              child: const Text("Enviar"),
            ),

            Column(
              children: [
                CheckboxListTile(
                  value: valorCheckbox.elementAt(0),
                  title: const Text("Ketchup"),
                  contentPadding: const EdgeInsets.only(left: 24, right: 150),
                  onChanged: (value){
                    valorCheckbox.removeAt(0);
                    valorCheckbox.insert(0, value!);
                    if (value == true) {
                      acompanhamentos.add("ketchup");
                    } else {
                      acompanhamentos.remove("ketchup");
                    }
                    atualizaPedido();
                  },
                ),
                CheckboxListTile(
                  value: valorCheckbox.elementAt(1),
                  title: const Text("Maionese"),
                  contentPadding: const EdgeInsets.only(left: 24, right: 150),
                  onChanged: (value){
                    valorCheckbox.removeAt(1);
                    valorCheckbox.insert(1, value!);
                    if (value == true) {
                      acompanhamentos.add("maionese");
                    } else {
                      acompanhamentos.remove("maionese");
                    }
                    atualizaPedido();
                  },
                ),
              ],
            ),

            Column(
              children: [
                RadioListTile(
                  value: "De carne",
                  title: Text("Carne"),
                  groupValue: valorRadio,
                  onChanged: (value) {
                    setState(() {
                      valorRadio = value!;
                      atualizaPedido();
                    });
                  },
                ),
                RadioListTile(
                  value: "De frango",
                  title: Text("Frango"),
                  groupValue: valorRadio,
                  onChanged: (value) {
                    setState(() {
                      valorRadio = value!;
                      atualizaPedido();
                    });
                  },
                ),
                RadioListTile(
                  value: "Sem carne",
                  title: Text("Vegano"),
                  groupValue: valorRadio,
                  onChanged: (value) {
                    setState(() {
                      valorRadio = value!;
                      atualizaPedido();
                    });
                  },
                ),
              ],
            ),

            Text(pedido, style: const TextStyle(fontSize: 20)),

            SwitchListTile(
              title: Text("Você é feliz?"),
              value: valorSwitch,
              activeColor: Colors.green[900],
              thumbIcon: MaterialStatePropertyAll(
                  Icon(Icons.tag_faces_rounded,color: Colors.white)
              ),
              onChanged: (value) {
                setState(() {valorSwitch = value;});
              },

            ),

            Slider(
              min: 0,
              max: 5,
              divisions: 5,
              value: valorSlider,
              activeColor: corSlider.elementAt(valorSlider.toInt()),
              onChanged: (value) {
                setState(() {
                  valorSlider = value;
                });
              },
            ),


          ],
        ),
      ),

    );
  }
}