import "package:flutter/material.dart";

void main() {
  runApp(
    HomeScaffold(),
  );
}

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  String _motivational_text = "First text";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Padding(
            padding: EdgeInsets.all(15),
            child: Text("Frases do dia"),
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
                Image(
                  image: AssetImage("images/logo.png"),
                ),
                Text(_motivational_text),
                RaisedButton(
                    onPressed: () {
                      setState(() {
                        _motivational_text =
                            "Você consegue, não desiste não!!!";
                      });
                    },
                    color: Colors.green[400],
                    child: Text("Nova frase"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
