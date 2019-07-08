import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/flutter_08/button_samples.dart';
import 'package:flutter_samples/flutter_17/route_samples.dart';

import 'hero_samples.dart';
import 'staggeranimation_samples.dart';

void main() {
  return runApp(ShowApp());
}

class ShowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ShowAppPage(),
      routes: <String, WidgetBuilder>{
        '/buttonpage': (BuildContext context) => ButtonSamples(),
        '/routepage': (BuildContext context) => RouteSamples(),
      },
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

  void _changeTextContent() {
    setState(() {
      //setState里用于刷新UI和绑定数据
      title = change ? "这个图片很好看，描述了春天的气息" : "春天的脚步近了，我们应该更加青春有朝气";
      change = !change;
    });
    gotoPage();
  }

  void gotoPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HeroSamples();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('春天的气息'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.all(10),
            //   child: Image.network(
            //       'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=eaad8629b0096b63951456026d5aec21/342ac65c103853431b19c6279d13b07ecb8088e6.jpg'),
            // ),
            // 动态绑定数据
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '$title',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            RaisedButton(
              onPressed: _changeTextContent,
              child: Text('CupertinoPageRoute跳转'),
            ),
            RaisedButton(
              child: Text("MaterialPageRoute跳转"),
              onPressed: () {
                pageRouter();
                // Navigator.pushNamed(
                //   context,
                //   '/buttonpage',
                //   arguments: <String, String>{
                //     'city': 'Berlin',
                //     'country': 'Germany',
                //   },
                // );
              },
            ),
            Hero(
                tag: "iconTag",
                child: Material(
                  child: InkWell(
                    child: Icon(
                      Icons.room,
                      size: 70.0,
                    ),
                    onTap: () {
                      gotoPage();
                    },
                  ),
                )),
            Hero(
                tag: "radialTag",
                child: Material(
                  child: InkWell(
                    child: ClipOval(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRect(
                          child: Image.asset(
                            "assets/image_appbar.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      gotoPage();
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void pageRouter() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            // 跳转过渡背景色
            barrierColor: Colors.blue,
            barrierDismissible: false,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return StaggerAnimationSamples();
            },
            transitionDuration: Duration(seconds: 3),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return ScaleTransition(scale: animation, child: child);
            }));
  }
}

void pageRouter(BuildContext context) {
  Navigator.push(
      context,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return ButtonSamples();
          },
          transitionDuration: Duration(seconds: 3),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return ScaleTransition(scale: animation, child: child);
          }));
}
