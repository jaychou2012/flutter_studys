import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_samples/flutter_10/LoadingDialog.dart';

enum Option { A, B, C }
enum Location { Barbados, Bahamas, Bermuda }

class DialogSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogSamplesState();
  }
}

class DialogSamplesState extends State<DialogSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Widget'),
        primary: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: RaisedButton(
        child: Text("Dialog"),
        onPressed: _showTheDilaog,
      ),
    );
  }

  _showTheDilaog() {
    dialog1(context);
  }

// AlertDialog
  Future<void> dialog1(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("提示"),
            content: new Text("是否退出"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text("取消")),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text("确定"))
            ],
          );
        });
  }

// AlertDialog
  Future<void> officialDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// SimpleDialog
  Future<void> dialog3(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("提示"),
          );
        });
  }

// SimpleDialog
  Future<void> dialog4(BuildContext context) async {
    switch (await showDialog<Option>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Answer'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
                child: const Text('A'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
                child: const Text('B'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
                child: const Text('C'),
              ),
            ],
          );
        })) {
      case Option.A:
        // Let's go.
        // ...
        print('A');
        break;
      case Option.B:
        // ...
        print('B');
        break;
      case Option.C:
        // ...
        print('C');
        break;
    }
  }

// 自定义Dialog
  Future<void> dialog5(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog(text: '正在加载...');
        });
  }

// AboutDialog
  Future<void> dialog6(BuildContext context) async {
    return showAboutDialog(
        context: context,
        applicationName: "应用名称",
        applicationVersion: "1.0.0",
        applicationIcon: Icon(Icons.apps),
        applicationLegalese: "内容");
  }
}
