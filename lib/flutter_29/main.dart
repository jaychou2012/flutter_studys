import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'eventbus_samples.dart';
import 'redux_app.dart';

// void main() => runApp(new MyApp());

void main() => runApp(ShowApp());

// void main() {
//   return runApp(
//       ScopedModel<CounterModel>(model: CounterModel(), child: ShowApp()));
// }

class ShowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: ShowAppPage(),
      ),
    );
  }
}

class ShowAppPage extends StatefulWidget {
  @override
  _ShowAppPageState createState() {
    return _ShowAppPageState();
  }
}

class _ShowAppPageState extends State<ShowAppPage> {
  String title = '春天的脚步近了，我们应该更加青春有朝气';
  bool change = false;

  @override
  void initState() {
    super.initState();
  }

  void gotoPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EventBusSamples();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Study'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                gotoPage();
              },
              child: Text('跳转'),
            ),
          ],
        ),
      ),
    );
  }
}
