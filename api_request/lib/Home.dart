import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cepInputController = TextEditingController();
  Map<String, dynamic> data;
  
  void _getCEP(String cep) async {
    String url = "http://viacep.com.br/ws/$cep/json/";

    http.Response response;

    response = await http.get(url);
    this.data = json.decode(response.body);
  }

  void _showResult(String cep) async{
    await _getCEP(cep);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Consumo de serviço web")),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                controller: _cepInputController,
              ),
              RaisedButton(
                  onPressed: ()=> _showResult(_cepInputController.text),
                  child: Text("Obter dados sobre o CEP")),
            ],
          ),
        ));
  }
}
