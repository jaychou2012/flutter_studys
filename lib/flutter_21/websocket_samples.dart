import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:flutter/material.dart';

class WebSocketSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebSocketSamplesState();
  }
}

class WebSocketSamplesState extends State<WebSocketSamples> {
  static WebSocket _webSocket;
  @override
  void initState() {
    super.initState();
    Future<WebSocket> futureWebSocket =
        WebSocket.connect('ws://192.168.1.8:8080');
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;

      _webSocket.add('message');
      // 监听事件
      void onData(dynamic content) {
        print('收到消息:' + content);
      }

      _webSocket.listen(onData, onDone: () {
        print('onDone');
      }, onError: () {
        print('onError');
      }, cancelOnError: true);
    });

    _webSocket.close();
    // mainSocket();
  }

  mainSocket() async {
    var channel = IOWebSocketChannel.connect("ws://192.168.1.8:8080");

    channel.stream.listen((message) {
      print('收到消息:' + message);
    });
  }

  void mainWeb() async {
    final channel = await IOWebSocketChannel.connect("ws://192.168.1.8:8080");

    channel.stream.listen((message) {
      channel.sink.add("received!");
      channel.sink.close(status.goingAway);
    });
    channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket Widget'), primary: true),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  '我是按钮一\n 按钮',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text(
                  '   我是按钮二  ',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text(
                  '      我是按钮三    ',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
