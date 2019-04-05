import 'package:flutter/material.dart';

void main() {
  return runApp(ShowApp());
}

class ShowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ShowAppPage(),
    );
  }
}

class ShowAppPage extends StatefulWidget {
  @override
  _ShowAppPageState createState() {
    return _ShowAppPageState();
  }
}

class _ShowAppPageState extends State<ShowAppPage> {
  String title = '春天的脚步近了，我们应该更加青春有朝气';
  bool change = false;

  void _changeTextContent() {
    setState(() {
      //setState里用于刷新UI和绑定数据
      title = change ? "这个图片很好看，描述了春天的气息" : "春天的脚步近了，我们应该更加青春有朝气";
      change = !change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('春天的气息'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                  'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=eaad8629b0096b63951456026d5aec21/342ac65c103853431b19c6279d13b07ecb8088e6.jpg'),
            ),
            // 动态绑定数据
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '$title',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            RaisedButton(
              onPressed: _changeTextContent,
              child: Text('点击更换内容'),
            ),
          ],
        ),
      ),
    );
  }
}
