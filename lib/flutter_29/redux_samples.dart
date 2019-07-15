import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux_app.dart';
import 'redux_detail_samples.dart';

class ReduxSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReduxSamplesState();
  }
}

class ReduxSamplesState extends State<ReduxSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int counter = StoreProvider.of<AppState>(context).state.counter;
    return Scaffold(
      appBar: AppBar(title: Text('Redux Samples'), primary: true),
      body: Text(
        '$counter',
        style: TextStyle(fontSize: 20),
      ),
      // body: StoreConnector<AppState, String>(converter: (store) {
      //   return store.state.counter.toString();
      // }, builder: (context, counter) {
      //   return Text(
      //     counter,
      //     style: TextStyle(fontSize: 20),
      //   );
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ReduxDetailSamples();
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
