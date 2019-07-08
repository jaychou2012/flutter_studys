import 'package:flutter/material.dart';

import 'button_samples.dart';

class RouteSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteSamplesState();
  }
}

class RouteSamplesState extends State<RouteSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Route Demo'), primary: true),
        body: Center(
            child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("路由跳转"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/weather',
                  arguments: <String, String>{
                    'city': 'Berlin',
                    'country': 'Germany',
                  },
                );
              },
            ),
            FlatButton(
              child: Text("路由跳转"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ButtonSamples();
                }));
              },
            ),
            FlatButton(
              child: Text("路由跳转"),
              onPressed: () {
                Navigator.pop(context, '返回数据');
              },
            ),
            FlatButton(
                child: Text("路由跳转"),
                onPressed: () {
                  Navigator.push<String>(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ButtonSamples(title: '标题', name: '名称');
                  })).then((String result) {
                    //处理代码
                  });
                }),
            FlatButton(
              child: Text("路由跳转"),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  return ButtonSamples();
                }, transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return createTransition(animation, child);
                }));
              },
            ),
          ],
        )));
  }

  SlideTransition createTransition(Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, //这里的child是pageBuilder里返回的目标页面
    );
  }
}
