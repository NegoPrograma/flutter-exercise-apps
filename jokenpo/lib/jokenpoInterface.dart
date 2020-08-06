import "package:flutter/material.dart";

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  String _appChosenMove = "images/padrao.png";
  String _result = "Faça sua escolha!";
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
              ),
              Text(_result),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/pedra.png"),
                    fit: BoxFit.
                  ),
                  Image(
                    image: AssetImage("images/papel.png"),
                    fit: BoxFit.
                  ),
                  Image(
                    image: AssetImage("images/tesoura.png"),
                    fit: BoxFit.
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
