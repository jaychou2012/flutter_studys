import 'package:flutter/material.dart';

class HeroSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HeroSamplesState();
  }
}

class HeroSamplesState extends State<HeroSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero'), primary: true),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "iconTag",
            child: Icon(
              Icons.room,
              size: 70.0,
            ),
          ),
          Hero(
            tag: "radialTag",
            child: Image.asset(
              "assets/image_appbar.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
