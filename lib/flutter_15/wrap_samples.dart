import 'package:flutter/material.dart';

class WrapSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapSamplesState();
  }
}

class WrapSamplesState extends State<WrapSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Wrap Demo'), primary: true),
        body: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('A')),
              label: Text('全部'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('B')),
              label: Text('好评 66207'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('C')),
              label: Text('差评 3913'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('D')),
              label: Text('点映1'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('E')),
              label: Text('购票 75985'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('F')),
              label: Text('认证作者 23'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('G')),
              label: Text('同城 1496'),
            ),
          ],
        ));
  }
}
