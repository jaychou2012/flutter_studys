import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'practice_two_samples.dart';

//void main() => runApp(MyApp());

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MyApp();
    case 'route2':
      return MaterialApp(
        title: 'Flutter with Native',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: PracticeTwoSamples(),
      );
    case 'route3':
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
    default:
      return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Native',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter with Native'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel =
      EventChannel('com.flutter.eventchannel/stream');
  StreamSubscription _streamSubscription = null;

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  bool _hasPermission = false;
  String _eventString = '';

  @override
  void initState() {
    super.initState();
    _streamSubscription = eventChannel
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    print("原生发送过来的：$event.toString()");
    setState(() {
      _eventString = "原生发送过来的：$event";
    });
  }

  void _onError(Object error) {
    setState(() {
      PlatformException exception = error;
      _eventString = exception?.message ?? '错误';
    });
  }

  void _disableEvent() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('获取电池'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
            RaisedButton(
              child: Text('是否有权限'),
              onPressed: _requestPermission,
            ),
            Text('$_hasPermission'),
            RaisedButton(
              child: Text('添加原生布局'),
              onPressed: _addNativeLayout,
            ),
            RaisedButton(
              child: Text('跳转到原生页面'),
              onPressed: _toNativeActivity,
            ),
            RaisedButton(
              child: Text('接收原生发送的消息$_eventString'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  // 判断是否有权限，无权限就主动申请权限
  Future<Null> _requestPermission() async {
    bool hasPermission;
    try {
      // 传递参数，key-value形式
      hasPermission =
          await platform.invokeMethod('requestPermission', <String, dynamic>{
        'permissionName': 'WRITE_EXTERNAL_STORAGE',
        'permissionId': 0,
      });
    } on PlatformException catch (e) {
      hasPermission = false;
    }

    setState(() {
      _hasPermission = hasPermission;
    });
  }

  // 判断是否有权限，无权限就主动申请权限
  Future<Null> _addNativeLayout() async {
    try {
      await platform.invokeMethod('addNativeLayout');
    } on PlatformException catch (e) {}
  }

  // 跳转到原生页面
  Future<Null> _toNativeActivity() async {
    try {
      await platform.invokeMethod('toNativeActivity');
    } on PlatformException catch (e) {}
  }
}
