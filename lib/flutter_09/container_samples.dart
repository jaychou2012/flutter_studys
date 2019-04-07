import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContainerSamplesState();
  }
}

class ContainerSamplesState extends State<ContainerSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return containerWidget(context);
  }

  Widget containerWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        padding: const EdgeInsets.all(8.0),
        color: Colors.teal.shade700,
        alignment: Alignment.center,
        child: Text('Hello World',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white)),
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=eaad8629b0096b63951456026d5aec21/342ac65c103853431b19c6279d13b07ecb8088e6.jpg'),
            centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        transform: Matrix4.rotationZ(0.1),
      ),
    );
  }
  
}
