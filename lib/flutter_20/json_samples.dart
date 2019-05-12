import 'dart:convert';
import 'package:flutter/material.dart';

class JsonSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonSamplesState();
  }
}

class JsonSamplesState extends State<JsonSamples> {
  String _jsonString = '{"name": "Flutter Book","author": "Google"}';
  Map<String, dynamic> book;
  String _bookJson;

  String _jsonListString =
      '[{"name": "Flutter Book","author": "Google"},{"name": "Dart Book","author": "Google"}]';

  @override
  void initState() {
    super.initState();
    book = json.decode(_jsonString);
    _bookJson = json.encode(book);

    List books = json.decode(_jsonListString);
    print(books[0]["name"]);

    Map<String, dynamic> bookMap = json.decode(_jsonString);
    var bookBean = Book.fromJson(bookMap);
    print(bookBean.name);
    print(bookBean.author);

    String beanString = json.encode(bookBean);
    String beanString2 = json.encode(bookBean.toJson());

    print('beanString:'+beanString);

    print('beanString2:'+beanString2);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Json'), primary: true),
        body: Column(
          children: <Widget>[
            Text('Book Name：${book['name']}'),
            Text('Book Author：${book['author']}'),
            Text('Book JSON：$_bookJson'),
          ],
        ));
  }
}

class Book {
  String name;
  String author;

  Book(this.name, this.author);

  Book.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        author = json['author'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
      };
}