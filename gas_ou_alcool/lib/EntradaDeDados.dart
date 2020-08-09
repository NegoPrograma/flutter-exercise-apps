import 'package:flutter/material.dart';

class EntradaDeDados extends StatefulWidget {
  @override
  _EntradaDeDadosState createState() => _EntradaDeDadosState();
}

class _EntradaDeDadosState extends State<EntradaDeDados> {
  TextEditingController _gasTextController = TextEditingController();
  TextEditingController _alcoholTextController = TextEditingController();
  String _result = "";

  void _calculate() {
    double alcoholPrice = double.tryParse(_alcoholTextController.text);
    double gasPrice = double.tryParse(_gasTextController.text);
    String tempResult = "";

    if (alcoholPrice == null || gasPrice == null) {
      tempResult =
          "Valor digitado foi inválido. Favor utilizar ponto (.), não vírgulas(,)";
    }

    if (alcoholPrice / gasPrice >= 0.7) {
      tempResult = "É melhor abastecer com gasolina.";
    } else {
      tempResult = "É melhor abastecer com alcool.";
    }

    setState(() {
      _result = tempResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Gas ou Alcool"),
      ),
      body: Container(
        
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image(
                  image: AssetImage("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.justify,
                  ),
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
                    decoration: InputDecoration(
                        labelText: "Preço da gasolina, ex: 7.77"),
                    enabled: true,
                    controller: _gasTextController,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _calculate();
                  },
                  child:
                      Text("Calcular", style: TextStyle(color: Colors.white)),
                  color: Colors.blueAccent,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(_result),
                )
              ]),
        ),
      ),
    );
  }
}
