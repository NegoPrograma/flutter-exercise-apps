import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String result;
  
  Result(this.result);

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
              image: AssetImage("images/$result.png"),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image(
                image: AssetImage("images/botao_voltar.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
