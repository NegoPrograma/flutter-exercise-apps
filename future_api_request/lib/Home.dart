import 'package:future_api_request/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";
  int _selectedElement = 1;

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = List();
    for (var post in dadosJson) {
      print("post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
    //print( postagens.toString() );
  }

  void _post() async {
    String body = json
        .encode({"title": "new post", "userId": 2, "body": "foda", "id": null});
    http.Response response = await http.post(_urlBase + "/posts",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: body);
    var dadosJson = json.decode(response.body);
    print(dadosJson);
  }

  void _put(int index) async {
    String body = json.encode({
      "title": "post de index $index modificado com sucesso",
      "userId": 2,
      "id": null
    });
    http.Response response = await http.put(_urlBase + "/posts/$index",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: body);
    var dadosJson = json.decode(response.body);
    print(dadosJson);
  }

  void _delete(int index) async {
    http.Response response = await http.delete(
      _urlBase + "/posts/$index",
      headers: {"Content-type": "application/json; charset=UTF-8"},
    );
    var dadosJson = json.decode(response.body);
    print(dadosJson);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  onPressed: () => _post(),
                  child: Text("Salvar"),
                ),
                RaisedButton(
                  onPressed: () => _put(_selectedElement),
                  child: Text("atualizar"),
                ),
                RaisedButton(
                  onPressed: () => _delete(_selectedElement),
                  child: Text("deletar"),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print("lista: Erro ao carregar ");
                      } else {
                        print("lista: carregou!! ");
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List<Post> lista = snapshot.data;
                              Post post = lista[index];

                              return ListTile(
                                onTap: () => _selectedElement = index,
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
                              );
                            });
                      }
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
