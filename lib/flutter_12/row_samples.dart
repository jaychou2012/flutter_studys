import 'package:flutter/material.dart';

class RowSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RowSamplesState();
  }
}

class RowSamplesState extends State<RowSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Widget'), primary: true),
      body:
       Column(
        children: <Widget>[
          Row(
            verticalDirection: VerticalDirection.up,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  '我是按钮一\n 按钮',
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              const FlutterLogo(),
              const Expanded(
                child: Text(
                    'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                " 我们居中显示 |",
                style: TextStyle(color: Colors.teal),
              ),
              Text(" Flutter的Row布局组件 "),
            ],
          ),
        ],
      ),
    );
  }
}
