import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _price;

  void _callAPI() async {
    String url = "https://blockchain.info/ticker";
    http.Response response;
    Map<String, dynamic> data;
    response = await http.get(url);
    data = json.decode(response.body);
    setState(() {
      _price = data["BRL"]["last"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Text(
              "R\$ $_price",
              style: TextStyle(fontSize: 24),
            ),
            RaisedButton(
              onPressed: () => _callAPI(),
              color: Color.fromRGBO(247, 147, 26, 1.0),
              child: Text(
                "Atualizar",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
