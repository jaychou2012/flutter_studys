import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'countermodel.dart';
import 'scoped_detail_samples.dart';

class ScopedSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScopedSamplesState();
  }
}

class ScopedSamplesState extends State<ScopedSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _model = CounterModel.of(context).counter;
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Samples'), primary: true),
      body: Column(
        children: <Widget>[
          // 方式一：ScopedModelDescendant来获取绑定属性值
          ScopedModelDescendant<CounterModel>(builder: (context, child, model) {
            return Text('${model.counter}',style: TextStyle(fontSize: 20),);
          }),
          // 方式二：CounterModel.of,本质是：ScopedModel.of<CounterModel>(context);
          Text('$_model',style: TextStyle(fontSize: 20),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScopedDetailSamples();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
