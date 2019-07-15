import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux_app.dart' as reduxApp;
import 'redux_app.dart';

class ReduxDetailSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReduxDetailSamplesState();
  }
}

class ReduxDetailSamplesState extends State<ReduxDetailSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux Samples'), primary: true),
      body: StoreConnector<AppState, String>(
        converter: (store) => store.state.counter.toString(),
        builder: (context, counter) {
          return Text(
            counter,
            style: TextStyle(fontSize: 20),
          );
        },
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
            //store.dispatch用于执行Actions里的方法
            return store.dispatch(reduxApp.Actions.Increment);
          };
        },
        // 简化为lambda表达式就是：converter: (store) => () => store.dispatch(Actions.Decrement),
        builder: (context, callback) {
          return FloatingActionButton(
            // 这里点击就会执行converter返回的操作或数值
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
