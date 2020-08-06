import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(home: HomeScaffold()),
  );
}

class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  String _motivationalText = "First text";
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
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
                Text(_motivationalText),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _motivationalText = "Você consegue, não desiste não!!!";
                    });
                  },
                  color: Colors.green[400],
                  child: Text("Nova frase"),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
