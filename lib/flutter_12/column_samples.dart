import 'package:flutter/material.dart';

class ColumnSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ColumnSamplesState();
  }
}

class ColumnSamplesState extends State<ColumnSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Widget'), primary: true),
      body: 
      Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text(
              '我是按钮一',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          RaisedButton(
            color: Colors.grey,
            child: Text(
              '   我是按钮二  ',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {},
          ),
          RaisedButton(
            color: Colors.orange,
            child: Text(
              '      我是按钮三    ',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          const FlutterLogo(),
          Text(
              'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
          const Icon(Icons.sentiment_very_satisfied),
        ],
      ),
    );
  }
}
