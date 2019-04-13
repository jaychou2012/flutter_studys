import 'package:flutter/material.dart';

class StackSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackSamplesState();
  }
}

class StackSamplesState extends State<StackSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stack Widget'), primary: true),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.teal,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Text(
                  "Stack",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            IndexedStack(
              index: 2,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.teal,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Text(
                  "Stack",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ));
  }
}
