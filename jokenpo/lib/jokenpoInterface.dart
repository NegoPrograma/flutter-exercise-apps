import 'dart:math';
import "package:flutter/material.dart";

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  String _appChosenMove = "images/padrao.png";
  String _result = "Faça sua escolha!";

  void play(String playerChoice) {
    List<String> cpuOptions = ["pedra", "papel", "tesoura"];
    String cpuChoice = cpuOptions[Random().nextInt(3)];

    setState(() {
      _appChosenMove = "images/$cpuChoice.png";
    });

    if (playerChoice == cpuChoice) {
      setState(() {
        _result = "Empate!";
      });
    } else if ((playerChoice == "pedra" && cpuChoice == "tesoura") ||
        (playerChoice == "papel" && cpuChoice == "pedra") ||
        (playerChoice == "tesoura" && cpuChoice == "papel")) {
      setState(() {
        _result = "Jogador venceu!";
      });
    } else {
      setState(() {
        _result = "CPU venceu!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: EdgeInsets.all(15),
          child: Text("Jokenpo!"),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Escolha do App:"),
              Image(
                image: AssetImage(_appChosenMove),
                height: 80,
              ),
              Text(_result),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Image(
                      image: AssetImage("images/pedra.png"),
                      height: 80,
                    ),
                    onTap: () => this.play("pedra"),
                  ),
                  GestureDetector(
                    child: Image(
                      image: AssetImage("images/papel.png"),
                      height: 80,
                    ),
                    onTap: () => this.play("papel"),
                  ),
                  GestureDetector(
                    child: Image(
                      image: AssetImage("images/tesoura.png"),
                      height: 80,
                    ),
                    onTap: () => this.play("tesoura"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
