import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;
  String _imageURL="";
  String _statusUpload = "Upload não iniciado";

  Future _getImage(String imageSource) async {
    if (imageSource == "camera") {
      _image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = _image;
    });
  }

  Future _uploadImage(File _image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference storageRoot = storage.ref();
    StorageReference file = storageRoot.child("photos").child("photo3.jpg");

    StorageUploadTask task = file.putFile(_image);

    //Controlar progresso do upload
    task.events.listen((StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Upload realizado com sucesso!";
        });
      }
    });

    //Recuperar url da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    _imageURL = await snapshot.ref.getDownloadURL();
    print("URL: $_imageURL");
    setState(() {
      _imageURL = _imageURL;
    });
  }

  dynamic setImage(File _image) {
    if (_image == null) return Container();
    return Image.file(_image);
  }

  dynamic _downloadImage(String url){
    if(url != "") return Image.network(url);
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Selecionando Imagens")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(_statusUpload),
              RaisedButton(
                onPressed: () {
                  _getImage("camera");
                },
                child: Text("Camera"),
              ),
              RaisedButton(
                onPressed: () {
                  _getImage("gallery");
                },
                child: Text("Galeria"),
              ),
              RaisedButton(
                onPressed: () {
                  _uploadImage(_image);
                },
                child: Text("Fazer upload da imagem."),
              ),
              setImage(_image),
              _downloadImage(_imageURL),
            ],
          ),
        ));
  }
}
