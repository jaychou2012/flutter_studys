import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CenterSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CenterSamplesState();
  }
}

class CenterSamplesState extends State<CenterSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return centerWidget(context);
  }

  Widget centerWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Center"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            child: Center(
              widthFactor: 2,
              heightFactor: 2,
              child: Container(
                width: 60,
                height: 30,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 60,
              height: 30,
              color: Colors.teal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.yellow,
              child: Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
