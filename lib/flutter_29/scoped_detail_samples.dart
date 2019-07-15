import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'countermodel.dart';

class ScopedDetailSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScopedDetailSamplesState();
  }
}

class ScopedDetailSamplesState extends State<ScopedDetailSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Samples'), primary: true),
      body:
          ScopedModelDescendant<CounterModel>(builder: (context, child, model) {
        return Text('${model.counter}',style: TextStyle(fontSize: 20),);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: CounterModel.of(context).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
