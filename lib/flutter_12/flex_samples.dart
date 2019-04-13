import 'package:flutter/material.dart';

class FlexSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlexSamplesState();
  }
}

class FlexSamplesState extends State<FlexSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flex Widget'), primary: true),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  '我是按钮一',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: RaisedButton(
                      color: Colors.grey,
                      child: Text(
                        '   我是按钮一  ',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        '   我是按钮二  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: RaisedButton(
                color: Colors.grey,
                child: Text(
                  '   我是按钮二  ',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
