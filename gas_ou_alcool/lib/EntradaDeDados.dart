import 'package:flutter/material.dart';

class EntradaDeDados extends StatefulWidget {
  @override
  _EntradaDeDadosState createState() => _EntradaDeDadosState();
}

class _EntradaDeDadosState extends State<EntradaDeDados> {
  TextEditingController _gasTextController = TextEditingController();
  TextEditingController _alcoholTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Gas ou Alcool"),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(children: <Widget>[
          Image(image: AssetImage("images/logo.png")),
          Text(
            "Saiba qual a melhor opção para abastecimento do seu carro",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do alcool, ex: 3.15"),
              enabled: true,
              controller: _alcoholTextController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço da gasolina, ex: 7.77"),
              enabled: true,
              controller: _gasTextController,
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("pressionado");
            },
            child: Text("Calcular"),
            color: Colors.blueAccent,
            minWidth: 
          ),
        ]),
      ),
    );
  }
}
