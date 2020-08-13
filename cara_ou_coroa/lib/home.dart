import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cara_ou_coroa/result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _showResult(BuildContext context) {
    List<String> possibleResults = ["moeda_cara", "moeda_coroa"];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(possibleResults[Random().nextInt(2)]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(97, 189, 140, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage("images/logo.png"),
            ),
            GestureDetector(
              onTap: () => _showResult(context),
              child: Image(
                image: AssetImage("images/botao_jogar.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
